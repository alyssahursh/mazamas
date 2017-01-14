class ClimbClassesController < ApplicationController
  before_action :set_climb_class, only: [:show, :edit, :update, :destroy]

  # GET /climb_classes
  # GET /climb_classes.json
  def index
    @climb_classes = ClimbClass.all
  end

  # GET /climb_classes/1
  # GET /climb_classes/1.json
  def show
  end

  # GET /climb_classes/new
  def new
    @climb_class = ClimbClass.new
  end

  # GET /climb_classes/1/edit
  def edit
  end

  # POST /climb_classes
  # POST /climb_classes.json
  def create
    @climb_class = ClimbClass.new(climb_class_params)

    respond_to do |format|
      if @climb_class.save
        format.html { redirect_to @climb_class, notice: 'Climb class was successfully created.' }
        format.json { render :show, status: :created, location: @climb_class }
      else
        format.html { render :new }
        format.json { render json: @climb_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_classes/1
  # PATCH/PUT /climb_classes/1.json
  def update
    respond_to do |format|
      if @climb_class.update(climb_class_params)
        format.html { redirect_to @climb_class, notice: 'Climb class was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_class }
      else
        format.html { render :edit }
        format.json { render json: @climb_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_classes/1
  # DELETE /climb_classes/1.json
  def destroy
    @climb_class.destroy
    respond_to do |format|
      format.html { redirect_to climb_classes_url, notice: 'Climb class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_class
      @climb_class = ClimbClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_class_params
      params.fetch(:climb_class, {})
    end
end
