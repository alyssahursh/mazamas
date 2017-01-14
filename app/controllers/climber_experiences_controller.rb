class ClimberExperiencesController < ApplicationController
  before_action :set_climber_experience, only: [:show, :edit, :update, :destroy]

  # GET /climber_experiences
  # GET /climber_experiences.json
  def index
    @climber_experiences = ClimberExperience.all
  end

  # GET /climber_experiences/1
  # GET /climber_experiences/1.json
  def show
  end

  # GET /climber_experiences/new
  def new
    @climber_experience = ClimberExperience.new
  end

  # GET /climber_experiences/1/edit
  def edit
  end

  # POST /climber_experiences
  # POST /climber_experiences.json
  def create
    @climber_experience = ClimberExperience.new(climber_experience_params)

    respond_to do |format|
      if @climber_experience.save
        format.html { redirect_to @climber_experience, notice: 'Climber experience was successfully created.' }
        format.json { render :show, status: :created, location: @climber_experience }
      else
        format.html { render :new }
        format.json { render json: @climber_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climber_experiences/1
  # PATCH/PUT /climber_experiences/1.json
  def update
    respond_to do |format|
      if @climber_experience.update(climber_experience_params)
        format.html { redirect_to @climber_experience, notice: 'Climber experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @climber_experience }
      else
        format.html { render :edit }
        format.json { render json: @climber_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climber_experiences/1
  # DELETE /climber_experiences/1.json
  def destroy
    @climber_experience.destroy
    respond_to do |format|
      format.html { redirect_to climber_experiences_url, notice: 'Climber experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climber_experience
      @climber_experience = ClimberExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climber_experience_params
      params.fetch(:climber_experience, {})
    end
end
