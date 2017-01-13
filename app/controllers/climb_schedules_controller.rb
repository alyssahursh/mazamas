class ClimbSchedulesController < ApplicationController
  before_action :set_climb_schedule, only: [:show, :edit, :update, :destroy]

  # GET /climb_schedules
  # GET /climb_schedules.json
  def index
    @climb_schedules = ClimbSchedule.all
  end

  # GET /climb_schedules/1
  # GET /climb_schedules/1.json
  def show
  end

  # GET /climb_schedules/new
  def new
    @climb_schedule = ClimbSchedule.new
  end

  # GET /climb_schedules/1/edit
  def edit
  end

  # POST /climb_schedules
  # POST /climb_schedules.json
  def create
    @climb_schedule = ClimbSchedule.new(climb_schedule_params)

    respond_to do |format|
      if @climb_schedule.save
        format.html { redirect_to @climb_schedule, notice: 'Climb schedule was successfully created.' }
        format.json { render :show, status: :created, location: @climb_schedule }
      else
        format.html { render :new }
        format.json { render json: @climb_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_schedules/1
  # PATCH/PUT /climb_schedules/1.json
  def update
    respond_to do |format|
      if @climb_schedule.update(climb_schedule_params)
        format.html { redirect_to @climb_schedule, notice: 'Climb schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_schedule }
      else
        format.html { render :edit }
        format.json { render json: @climb_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_schedules/1
  # DELETE /climb_schedules/1.json
  def destroy
    @climb_schedule.destroy
    respond_to do |format|
      format.html { redirect_to climb_schedules_url, notice: 'Climb schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_schedule
      @climb_schedule = ClimbSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_schedule_params
      params.fetch(:climb_schedule, {})
    end
end
