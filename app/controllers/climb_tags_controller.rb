class ClimbTagsController < ApplicationController
  before_action :set_climb_tag, only: [:show, :edit, :update, :destroy]

  # GET /climb_tags
  # GET /climb_tags.json
  def index
    @climb_tags = ClimbTag.all
  end

  # GET /climb_tags/1
  # GET /climb_tags/1.json
  def show
  end

  # GET /climb_tags/new
  def new
    @climb_tag = ClimbTag.new
  end

  # GET /climb_tags/1/edit
  def edit
  end

  # POST /climb_tags
  # POST /climb_tags.json
  def create
    @climb_tag = ClimbTag.new(climb_tag_params)

    respond_to do |format|
      if @climb_tag.save
        format.html { redirect_to @climb_tag, notice: 'Climb tag was successfully created.' }
        format.json { render :show, status: :created, location: @climb_tag }
      else
        format.html { render :new }
        format.json { render json: @climb_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_tags/1
  # PATCH/PUT /climb_tags/1.json
  def update
    respond_to do |format|
      if @climb_tag.update(climb_tag_params)
        format.html { redirect_to @climb_tag, notice: 'Climb tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_tag }
      else
        format.html { render :edit }
        format.json { render json: @climb_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_tags/1
  # DELETE /climb_tags/1.json
  def destroy
    @climb_tag.destroy
    respond_to do |format|
      format.html { redirect_to climb_tags_url, notice: 'Climb tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_tag
      @climb_tag = ClimbTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_tag_params
      params.fetch(:climb_tag, {})
    end
end
