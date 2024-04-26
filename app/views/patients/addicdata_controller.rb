class AddicdataController < ApplicationController
  before_action :set_addicdata, only: %i[ show edit update destroy ]
  before_action :set_patient, only: %i[ show edit update destroy ]

  # GET /addicdata or /addicdata.json
  def index
    @addicdata = Addicdata.all
  end

  # GET /addicdata/1 or /addicdata/1.json
  def show
  end

  # GET /addicdata/new
  def new
    @patient=
    @addicdata = Addicdata.new
  end

  # GET /addicdata/1/edit
  def edit
  end

  # POST /addicdata or /addicdata.json
  def create
    @addicdata = Addicdata.new(addicdata_params)

    respond_to do |format|
      if @addicdata.save
        format.html { redirect_to addicdata_url(@addicdata), notice: "Addicdata was successfully created." }
        format.json { render :show, status: :created, location: @addicdata }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @addicdata.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addicdata/1 or /addicdata/1.json
  def update
    respond_to do |format|
      if @addicdata.update(addicdata_params)
        format.html { redirect_to addicdata_url(@addicdata), notice: "Addicdata was successfully updated." }
        format.json { render :show, status: :ok, location: @addicdata }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @addicdata.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addicdata/1 or /addicdata/1.json
  def destroy
    @addicdata.destroy

    respond_to do |format|
      format.html { redirect_to addicdata_url, notice: "Addicdata was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addicdata
      @addicdata = Patient.find(params[:id]).addicdata
    end

    # Only allow a list of trusted parameters through.
    def addicdata_params
      params.require(:addicdata).permit(:what, :severity, :progress, :difficulties, :frequency, :trouble, :method, :goal, :controlstimulustext, :controlstimulusinstruction, :pseudoactinstruction, :imaginationinstruction, :essayok, :essay, :supplement)
    end
end
