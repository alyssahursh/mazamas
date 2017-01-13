class MountainsController < ApplicationController
  before_action :set_mountain, only: [:show, :edit, :update, :destroy]

  # GET /mountains
  # GET /mountains.json
  def index
    @mountains = Mountain.all
  end

  # GET /mountains/1
  # GET /mountains/1.json
  def show
  end

  # GET /mountains/new
  def new
    @mountain = Mountain.new
  end

  # GET /mountains/1/edit
  def edit
  end

  # POST /mountains
  # POST /mountains.json
  def create
    @mountain = Mountain.new(mountain_params)

    respond_to do |format|
      if @mountain.save
        format.html { redirect_to @mountain, notice: 'Mountain was successfully created.' }
        format.json { render :show, status: :created, location: @mountain }
      else
        format.html { render :new }
        format.json { render json: @mountain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mountains/1
  # PATCH/PUT /mountains/1.json
  def update
    respond_to do |format|
      if @mountain.update(mountain_params)
        format.html { redirect_to @mountain, notice: 'Mountain was successfully updated.' }
        format.json { render :show, status: :ok, location: @mountain }
      else
        format.html { render :edit }
        format.json { render json: @mountain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mountains/1
  # DELETE /mountains/1.json
  def destroy
    @mountain.destroy
    respond_to do |format|
      format.html { redirect_to mountains_url, notice: 'Mountain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mountain
      @mountain = Mountain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mountain_params
      params.fetch(:mountain, {})
    end
end
