class ImaginationtextsController < ApplicationController
  before_action :set_imaginationtext, only: %i[ show edit update destroy ]

  # GET /imaginationtexts or /imaginationtexts.json
  def index
    @imaginationtexts = Imaginationtext.all
  end

  # GET /imaginationtexts/1 or /imaginationtexts/1.json
  def show
  end

  # GET /imaginationtexts/new
  def new
    @imaginationtext = Imaginationtext.new
  end

  # GET /imaginationtexts/1/edit
  def edit
  end

  # POST /imaginationtexts or /imaginationtexts.json
  def create
    @imaginationtext = Imaginationtext.new(imaginationtext_params)

    respond_to do |format|
      if @imaginationtext.save
        format.html { redirect_to imaginationtext_url(@imaginationtext), notice: "Imaginationtext was successfully created." }
        format.json { render :show, status: :created, location: @imaginationtext }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @imaginationtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imaginationtexts/1 or /imaginationtexts/1.json
  def update
    respond_to do |format|
      if @imaginationtext.update(imaginationtext_params)
        format.html { redirect_to imaginationtext_url(@imaginationtext), notice: "Imaginationtext was successfully updated." }
        format.json { render :show, status: :ok, location: @imaginationtext }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @imaginationtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imaginationtexts/1 or /imaginationtexts/1.json
  def destroy
    @imaginationtext.destroy

    respond_to do |format|
      format.html { redirect_to imaginationtexts_url, notice: "Imaginationtext was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imaginationtext
      @imaginationtext = Imaginationtext.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imaginationtext_params
      params.require(:imaginationtext).permit(:addicdatum_id)
    end
end
