class ClimbsController < ApplicationController
  before_action :set_climb, only: [:show, :edit, :update, :destroy]
  before_filter :set_search


  # GET /climbs
  # GET /climbs.json
  def index
    if !params[:commit].nil? && params[:commit].downcase == "search"
      if !params[:q].blank?
        @results = Climb.search(params[:q])
        puts @results.result
      else
        @results = Climb.search({:id_eq => 0})
      end

      @climbs = @results.result

    else
      @climbs = Climb.paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html
      format.js
      # format.json { render json: # some JSON data }
    end
  end

  # GET /climbs/1
  # GET /climbs/1.json
  def show
  end

  # GET /climbs/new
  def new
    @climb = Climb.new
  end

  # GET /climbs/1/edit
  def edit
  end

  # POST /climbs
  # POST /climbs.json
  def create
    @climb = Climb.new(climb_params)

    respond_to do |format|
      if @climb.save
        format.html { redirect_to @climb, notice: 'Climb was successfully created.' }
        format.json { render :show, status: :created, location: @climb }
      else
        format.html { render :new }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climbs/1
  # PATCH/PUT /climbs/1.json
  def update
    respond_to do |format|
      if @climb.update(climb_params)
        format.html { redirect_to @climb, notice: 'Climb was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb }
      else
        format.html { render :edit }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climbs/1
  # DELETE /climbs/1.json
  def destroy
    @climb.destroy
    respond_to do |format|
      format.html { redirect_to climbs_url, notice: 'Climb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb
      @climb = Climb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_params
      params.fetch(:climb, {})
    end

    def check_status
      if spots_available <= 0 && climb_stats != "closed"
        climb_status = "waitlist"
      end
    end
end
