class ClimbLeaderProfilesController < ApplicationController
  before_action :set_climb_leader_profile, only: [:show, :edit, :update, :destroy]

  # GET /climb_leader_profiles
  # GET /climb_leader_profiles.json
  def index
    @climb_leader_profiles = ClimbLeaderProfile.joins(:user).order('users.first_name')

  end

  # GET /climb_leader_profiles/1
  # GET /climb_leader_profiles/1.json
  def show
  end

  # GET /climb_leader_profiles/new
  def new
    @climb_leader_profile = ClimbLeaderProfile.new
  end

  # GET /climb_leader_profiles/1/edit
  def edit
  end

  # POST /climb_leader_profiles
  # POST /climb_leader_profiles.json
  def create
    @climb_leader_profile = ClimbLeaderProfile.new(climb_leader_profile_params)

    respond_to do |format|
      if @climb_leader_profile.save
        format.html { redirect_to @climb_leader_profile, notice: 'Climb leader profile was successfully created.' }
        format.json { render :show, status: :created, location: @climb_leader_profile }
      else
        format.html { render :new }
        format.json { render json: @climb_leader_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_leader_profiles/1
  # PATCH/PUT /climb_leader_profiles/1.json
  def update
    respond_to do |format|
      if @climb_leader_profile.update(climb_leader_profile_params)
        format.html { redirect_to @climb_leader_profile, notice: 'Climb leader profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_leader_profile }
      else
        format.html { render :edit }
        format.json { render json: @climb_leader_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_leader_profiles/1
  # DELETE /climb_leader_profiles/1.json
  def destroy
    @climb_leader_profile.destroy
    respond_to do |format|
      format.html { redirect_to climb_leader_profiles_url, notice: 'Climb leader profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_leader_profile
      @climb_leader_profile = ClimbLeaderProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_leader_profile_params
      params.fetch(:climb_leader_profile, {})
    end
end
