class ClimbAppsController < ApplicationController
  before_action :set_climb_app, only: [:show, :edit, :update, :destroy]

  # GET /climb_apps
  # GET /climb_apps.json
  def index
    @climb_apps = ClimbApp.all
  end

  # GET /climb_apps/1
  # GET /climb_apps/1.json
  def show
  end

  # GET /climb_apps/new
  def new
    @climb_app = ClimbApp.new
  end

  # GET /climb_apps/1/edit
  def edit
  end

  # POST /climb_apps
  # POST /climb_apps.json
  def create
    @climb_app = ClimbApp.new(climb_app_params)

    respond_to do |format|
      if @climb_app.save
        format.html { redirect_to @climb_app, notice: 'ClimbApp was successfully created.' }
        format.json { render :show, status: :created, location: @climb_app }
      else
        format.html { render :new }
        format.json { render json: @climb_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_apps/1
  # PATCH/PUT /climb_apps/1.json
  def update
    respond_to do |format|
      if @climb_app.update(climb_app_params)
        format.html { redirect_to @climb_app, notice: 'ClimbApp was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_app }
      else
        format.html { render :edit }
        format.json { render json: @climb_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_apps/1
  # DELETE /climb_apps/1.json
  def destroy
    @climb_app.destroy
    respond_to do |format|
      format.html { redirect_to climb_apps_url, notice: 'ClimbApp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_app
      @climb_app = ClimbApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_app_params
      params.fetch(:climb_app, {})
    end
end
