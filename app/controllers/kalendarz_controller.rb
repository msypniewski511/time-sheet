class KalendarzController < ApplicationController
  skip_before_action :verify_authenticity_token
  include GrafiksHelper
  before_action :set_kalendarz_time
  
  def new
    if @s == 0
      @tablica_miesiaca = (tablica_miesiaca(@time))
    else
      @tablica_miesiaca = (tablica_miesiaca(@time))
      @tablica_miesiaca.slice!(0)
    end
    @grafik = Grafik.find(session[:grafik_id])
  end
  
  def create
    @tablica_miesiaca = (tablica_miesiaca(@time))
    @grafik = Grafik.find(session[:grafik_id])
    dane = oblicz(params[:kalendarz])
    @grafik.dane = dane
    respond_to do |format|
      if @grafik.save
        format.html { redirect_to shift_url(@grafik.shift_id), notice: 'Kalendarz został uaktualniony w grafiku'}
        format.json { render :show, status: :created, location: @grafik}
      else
        format.html { render :new }
        format.json { render json: @kalendarz.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    
    @grafik = Grafik.find(params[:id])
    @tablica_miesiaca = @grafik.dane.split
    if @grafik == Shift.find(@grafik.shift_id).grafiks.first
      @s = 1
      @tablica_miesiaca
    else
      @s = 1
      @tablica_miesiaca.slice!(0, 1)
    end
  
  end
  
  def update
    @grafik = Grafik.find(params[:id])
    @tablica_miesiaca = @grafik.dane.split
    kalendarz = params[:kalendarz]
    if @grafik == Shift.find(@grafik.shift_id).grafiks.first
      kalendarz.shift
    else
      kalendarz
    end
    @grafik.dane = oblicz(kalendarz)
    @grafik.save
    respond_to do |format|
      format.html { redirect_to shift_url(@grafik.shift_id), notice: "kalendarz został zaktualizowany." }
      format.json { render :show, status: :updated, localction: @shift }
    end
  end
  
  private
  
  def set_kalendarz_time
    shift = Shift.find(Grafik.find(session[:grafik_id]).shift_id)
    # Zmienna instancyjna użyta do przechodzenie przez kolejne miesiące.
    # Informuje o ilosci miesiecy w bazie. instancyjna bo będzie użyta w innej metodzie.
    @s = shift.grafiks.size - 1
    @time = Time.now + (2592000 * @s)
  end
  
  def kalendarz_params
    params.permit(:kalendarz)
  end
     # metoda zamieniająca tablicę kalendarza na string
    def oblicz(kalendarz)
      if @s > 0
        kalendarz.unshift("0")
      end
        # Zmienna otrzymana z formularza
        # Tablica bedzie szkieletem miesiaca.
        tmp_string = @tablica_miesiaca
        i = 0
        # Tablica wynikowa która zostanie scalona do stringu wynikowego.
        wynik = []
        tmp_string.each do |dzien|
          
            tab = dzien.split('|')
            if kalendarz[i] == "1"
                wynik[i] = tab[0].to_s + "|work-day"
            elsif kalendarz[i] == "2"
                wynik[i] = tab[0].to_s + "|night-day"
            elsif kalendarz[i] == "3"
                wynik[i] = tab[0].to_s + "|another-month"
            else
                wynik[i] = tab[0].to_s
            end
            i += 1
            puts kalendarz.inspect
        end
        return wynik.join(' ')
    end
end
