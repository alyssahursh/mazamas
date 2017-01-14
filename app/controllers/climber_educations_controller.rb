class ClimberEducationsController < ApplicationController
  before_action :set_climber_education, only: [:show, :edit, :update, :destroy]

  # GET /climber_educations
  # GET /climber_educations.json
  def index
    @climber_educations = ClimberEducation.all
  end

  # GET /climber_educations/1
  # GET /climber_educations/1.json
  def show
  end

  # GET /climber_educations/new
  def new
    @climber_education = ClimberEducation.new
  end

  # GET /climber_educations/1/edit
  def edit
  end

  # POST /climber_educations
  # POST /climber_educations.json
  def create
    @climber_education = ClimberEducation.new(climber_education_params)

    respond_to do |format|
      if @climber_education.save
        format.html { redirect_to @climber_education, notice: 'Climber education was successfully created.' }
        format.json { render :show, status: :created, location: @climber_education }
      else
        format.html { render :new }
        format.json { render json: @climber_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climber_educations/1
  # PATCH/PUT /climber_educations/1.json
  def update
    respond_to do |format|
      if @climber_education.update(climber_education_params)
        format.html { redirect_to @climber_education, notice: 'Climber education was successfully updated.' }
        format.json { render :show, status: :ok, location: @climber_education }
      else
        format.html { render :edit }
        format.json { render json: @climber_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climber_educations/1
  # DELETE /climber_educations/1.json
  def destroy
    @climber_education.destroy
    respond_to do |format|
      format.html { redirect_to climber_educations_url, notice: 'Climber education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climber_education
      @climber_education = ClimberEducation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climber_education_params
      params.fetch(:climber_education, {})
    end
end
