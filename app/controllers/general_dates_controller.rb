class GeneralDatesController < ApplicationController
  before_action :set_general_date, only: [:show, :edit, :update, :destroy]

  # GET /general_dates
  # GET /general_dates.json
  def index
    @general_dates = GeneralDate.all
  end

  # GET /general_dates/1
  # GET /general_dates/1.json
  def show
  end

  # GET /general_dates/new
  def new
    @general_date = GeneralDate.new
  end

  # GET /general_dates/1/edit
  def edit
  end

  # POST /general_dates
  # POST /general_dates.json
  def create
    @general_date = GeneralDate.new(general_date_params)

    respond_to do |format|
      if @general_date.save
        format.html { redirect_to @general_date, notice: 'General date was successfully created.' }
        format.json { render :show, status: :created, location: @general_date }
      else
        format.html { render :new }
        format.json { render json: @general_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_dates/1
  # PATCH/PUT /general_dates/1.json
  def update
    respond_to do |format|
      if @general_date.update(general_date_params)
        format.html { redirect_to @general_date, notice: 'General date was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_date }
      else
        format.html { render :edit }
        format.json { render json: @general_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_dates/1
  # DELETE /general_dates/1.json
  def destroy
    @general_date.destroy
    respond_to do |format|
      format.html { redirect_to general_dates_url, notice: 'General date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_date
      @general_date = GeneralDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_date_params
      params.fetch(:general_date, {})
    end
end
