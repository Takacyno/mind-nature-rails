class ImaginationsController < ApplicationController
  before_action :set_imagination, only: %i[ show edit update destroy ]

  # GET /imaginations or /imaginations.json
  def index
    @imaginations = Imagination.all
  end

  # GET /imaginations/1 or /imaginations/1.json
  def show
  end

  # GET /imaginations/new
  def new
    @imagination = Imagination.new
  end

  # GET /imaginations/1/edit
  def edit
  end

  # POST /imaginations or /imaginations.json
  def create
    @imagination = Imagination.new(imagination_params)

    respond_to do |format|
      if @imagination.save
        format.html { redirect_to imagination_url(@imagination), notice: "Imagination was successfully created." }
        format.json { render :show, status: :created, location: @imagination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @imagination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imaginations/1 or /imaginations/1.json
  def update
    respond_to do |format|
      if @imagination.update(imagination_params)
        format.html { redirect_to imagination_url(@imagination), notice: "Imagination was successfully updated." }
        format.json { render :show, status: :ok, location: @imagination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @imagination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imaginations/1 or /imaginations/1.json
  def destroy
    @imagination.destroy

    respond_to do |format|
      format.html { redirect_to imaginations_url, notice: "Imagination was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagination
      @imagination = Imagination.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imagination_params
      params.require(:imagination).permit(:addicdatum_id)
    end
end
