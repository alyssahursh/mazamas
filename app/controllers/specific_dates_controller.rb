class SpecificDatesController < ApplicationController
  before_action :set_specific_date, only: [:show, :edit, :update, :destroy]

  # GET /specific_dates
  # GET /specific_dates.json
  def index
    @specific_dates = SpecificDate.all
  end

  # GET /specific_dates/1
  # GET /specific_dates/1.json
  def show
  end

  # GET /specific_dates/new
  def new
    @specific_date = SpecificDate.new
  end

  # GET /specific_dates/1/edit
  def edit
  end

  # POST /specific_dates
  # POST /specific_dates.json
  def create
    @specific_date = SpecificDate.new(specific_date_params)

    respond_to do |format|
      if @specific_date.save
        format.html { redirect_to @specific_date, notice: 'Specific date was successfully created.' }
        format.json { render :show, status: :created, location: @specific_date }
      else
        format.html { render :new }
        format.json { render json: @specific_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_dates/1
  # PATCH/PUT /specific_dates/1.json
  def update
    respond_to do |format|
      if @specific_date.update(specific_date_params)
        format.html { redirect_to @specific_date, notice: 'Specific date was successfully updated.' }
        format.json { render :show, status: :ok, location: @specific_date }
      else
        format.html { render :edit }
        format.json { render json: @specific_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_dates/1
  # DELETE /specific_dates/1.json
  def destroy
    @specific_date.destroy
    respond_to do |format|
      format.html { redirect_to specific_dates_url, notice: 'Specific date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_date
      @specific_date = SpecificDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specific_date_params
      params.fetch(:specific_date, {})
    end
end
