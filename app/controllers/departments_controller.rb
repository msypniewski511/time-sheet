class DepartmentsController < ApplicationController
    before_action :set_department, only:[:show, :edit, :update, :destroy]
    
    def index
        @departments = Department.all
    end
    def show
    end
    def new
        @department = Department.new
    end
    def edit
    end
    
    def create
        @department = Department.new(department_params)
        
        respond_to do |format|
            if @department.save
                format.html { redirect_to @department, notice: 'Departament został utworzony.' }
                format.json { render :show, status: :created, location: @department }
            else
                format.html { render :new }
                format.json { render json: @department.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @department.update(department_params)
                format.html { redirect_to @department, notice: 'Departament został zaktualizowany.' }
                format.json { render :show, status: :ok, location: @department }
            else
                format.html { render :edit }
                format.json { render json: @department.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @department.destroy
        respond_to do |format|
            format.html { redirect_to department_url, notice: 'Departament został usunięty.' }
            format.json { head :no_content }
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:nazwa)
    end
end
