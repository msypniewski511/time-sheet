class GrafiksController < ApplicationController
  include GrafiksHelper
  before_action :load_shift, :load_grafik
    
  def index
    @grafiks = Grafik.all
  end
    
    # Show metoda jest ladowana z poziomu zmiany.
    #def show
    #end
    
  # New metoda jest wywoływana z poziomu zmiany.
  def new
    @garfik = @shift.grafiks.new
  end
    
  def create

    @grafik = @shift.grafiks.new(grafik_params)
    respond_to do |format|
      if @grafik.save
        session[:grafik_id] = @grafik.id
        format.html { redirect_to kalendarz_new_path, notice: "Grafik został poprawnie zapisany." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @grafik.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @grafik.destroy
    respond_to do |format|
        format.html { redirect_to shifts_url, notice: 'Grafik został usunięty.'}
        format.json { head :no_content }
    end
  end

    
  private
    
  def grafik_params
    params.fetch(:grafik).permit(:nazwa, :dane, :shift_id)
  end
    
  def load_shift
    @shift = Shift.find(params[:shift_id])
  end
    
  def load_grafik
    if !session[:grafik_id].nil? == false
      @grafik = @shift.grafiks.find(session[:grafik_id])
    else
      @grafik = @shift.grafiks.first
    end
  end

end
