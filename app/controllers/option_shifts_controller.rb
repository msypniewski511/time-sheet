class OptionShiftsController < ApplicationController
  before_action :set_option_shift, only: [:show, :edit, :update, :destroy]
  before_action :set_opcje

  # GET /option_shifts
  # GET /option_shifts.json
  def index
    @option_shifts = OptionShift.all
  end

  # GET /option_shifts/1
  # GET /option_shifts/1.json
  def show
  end

  # GET /option_shifts/new
  def new
    @option_shift = OptionShift.new
  end

  # GET /option_shifts/1/edit
  def edit
  end

  # POST /option_shifts
  # POST /option_shifts.json
  def create
    @option_shift = OptionShift.new(option_shift_params)

    respond_to do |format|
      if @option_shift.save
        format.html { redirect_to @option_shift, notice: 'Option shift was successfully created.' }
        format.json { render :show, status: :created, location: @option_shift }
      else
        format.html { render :new }
        format.json { render json: @option_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /option_shifts/1
  # PATCH/PUT /option_shifts/1.json
  def update
    respond_to do |format|
      if @option_shift.update(option_shift_params)
        format.html { redirect_to @option_shift, notice: 'Option shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @option_shift }
      else
        format.html { render :edit }
        format.json { render json: @option_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_shifts/1
  # DELETE /option_shifts/1.json
  def destroy
    @option_shift.destroy
    respond_to do |format|
      format.html { redirect_to option_shifts_url, notice: 'Option shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_shift
      @option_shift = OptionShift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_shift_params
      params.require(:option_shift).permit(:option, :color, :description)
    end
    
    def set_opcje
      @opcje = ([["black", "#000000",], ["red", "#FF0000"], ["purple", "#800080"], ["fuchsia", "#FF00FF"], ["green", "#008000"], ["lime", "#00FF00"], ["olive", "#808000"], 
    ["yellow", "#FFFF00"], ["navy", "#000080"], ["blue", "#0000FF"], ["teal", "#008080"], ["aqua", "#00FFFF"], ["silver", "#C0C0C0"]])
    end
end
