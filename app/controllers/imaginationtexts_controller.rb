class ImaginationtextsController < ApplicationController
  include SetAddicdatum
  before_action :set_addicdatum_addic 
  before_action :set_imaginationtext, only: %i[ edit update show]
  before_action :set_new_imaginationtext, only: %i[ new create]
  # GET /imaginationtexts or /imaginationtexts.json
  def index
    @imaginationtexts = @addicdatum.imaginationtexts.all
  end

  # GET /imaginationtexts/1 or /imaginationtexts/1.json
  def show
  end

  # GET /imaginationtexts/new
  def new
  end

  # GET /imaginationtexts/1/edit
  def edit
  end

  # POST /imaginationtexts or /imaginationtexts.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @imaginationtext.update(imaginationtext_params)
        redirect_to patient_addicdatum_imaginationtexts_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_addicdatum_imaginationtext_path
      end
    end    
  end

  # PATCH/PUT /imaginationtexts/1 or /imaginationtexts/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @imaginationtext.update(imaginationtext_params)
        redirect_to patient_addicdatum_imaginationtext_path notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_addicdatum_imaginationtext_path
      end
    end    
  end

  # DELETE /imaginationtexts/1 or /imaginationtexts/1.json
  def destroy
    @imaginationtext.destroy

    respond_to do |format|
      format.html { redirect_to imaginationtexts_url, notice: "imaginationtext was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_imaginationtext
      @imaginationtext = @addicdatum.imaginationtexts.build
    end
    def set_imaginationtext
      @imaginationtext = @addicdatum.imaginationtexts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imaginationtext_params
      params.require(:imaginationtext).permit(:addicdatum_id,:imaginationtext)
    end

end

