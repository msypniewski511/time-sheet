class ShiftsController < ApplicationController
    before_action :set_ships, only:[:show, :edit, :destroy, :update]
    
    def index
        @shifts = Shift.all
    end
    
    def show
    end
    
    def new
        @shift = Shift.new
    end
    
    def create
        @shift = Shift.new(shift_params)
        respond_to do |format|
            if @shift.save
                format.html {redirect_to @shift, notice: "Zmiana została zapisana"}
                format.json {render :show, status: :created, location: @shift}
            else
                format.html {render :new}
                format.json {render json: @employee.errors, status: :unprocessable_entity}
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @shift.update(shift_params)
                format.html {redirect_to @shift, notice: "Zmiana została zaktualizowana"}
                format.json {render show, status: :ok, location: @shift}
            else
                format.html {render :edit}
                format.json { render json: @employee.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @shift.destroy
        respond_to do |format|
            format.html {redirect_to shifts_url, notice: "Zmiana została usunięta"}
            format.json {head :no_content}
        end
    end
    
    def grafik
    end
    
    private
    def set_ships
        @shift = Shift.find(params[:id])
    end
    
    def shift_params
        params.require(:shift).permit(:nazwa)
    end
end
