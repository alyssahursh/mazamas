class ClimberProfilesController < ApplicationController
  before_action :set_climber_profile, only: [:show, :edit, :update, :destroy]

  # GET /climber_profiles
  # GET /climber_profiles.json
  def index
    @climber_profiles = ClimberProfile.all
  end

  # GET /climber_profiles/1
  # GET /climber_profiles/1.json
  def show
  end

  # GET /climber_profiles/new
  def new
    @climber_profile = ClimberProfile.new
  end

  # GET /climber_profiles/1/edit
  def edit
  end

  # POST /climber_profiles
  # POST /climber_profiles.json
  def create
    @climber_profile = ClimberProfile.new(climber_profile_params)

    respond_to do |format|
      if @climber_profile.save
        format.html { redirect_to @climber_profile, notice: 'Climber profile was successfully created.' }
        format.json { render :show, status: :created, location: @climber_profile }
      else
        format.html { render :new }
        format.json { render json: @climber_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climber_profiles/1
  # PATCH/PUT /climber_profiles/1.json
  def update
    respond_to do |format|
      if @climber_profile.update(climber_profile_params)
        format.html { redirect_to @climber_profile, notice: 'Climber profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @climber_profile }
      else
        format.html { render :edit }
        format.json { render json: @climber_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climber_profiles/1
  # DELETE /climber_profiles/1.json
  def destroy
    @climber_profile.destroy
    respond_to do |format|
      format.html { redirect_to climber_profiles_url, notice: 'Climber profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climber_profile
      @climber_profile = ClimberProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climber_profile_params
      params.fetch(:climber_profile, {})
    end
end
