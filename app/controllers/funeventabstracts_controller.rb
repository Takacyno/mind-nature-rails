class FuneventabstractsController < ApplicationController
  include SetPatient
  include SetAddicdatum
  before_action :set_patient_addic
  before_action :set_addicdatum_addic
  before_action :set_funeventabstract, only: %i[ show edit update ]
  before_action :set_new_funeventabstract, only: %i[ new create]

  # GET /funeventabstracts or /funeventabstracts.json
  def index
    @funeventabstracts = @patient.funeventabstracts.all
  end

  # GET /funeventabstracts/1 or /funeventabstracts/1.json
  def show
  end

  # GET /funeventabstracts/new
  def new
  end

  # GET /funeventabstracts/1/edit
  def edit
  end

  # POST /funeventabstracts or /funeventabstracts.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @funeventabstract.update(funeventabstract_params)
        redirect_to patient_funeventabstracts_path(addicdatum_id:@addicdatum.id), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_funeventabstracts_path(addicdatum_id:@addicdatum.id)
      end
    end    
  end

  # PATCH/PUT /funeventabstracts/1 or /funeventabstracts/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @funeventabstract.update(funeventabstract_params)
        redirect_to patient_funeventabstract_path(id:@funeventabstract.id,addicdatum_id:@addicdatum.id), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to patient_funeventabstract_path(id:@funeventabstract.id,addicdatum_id:@addicdatum.id)
      end
    end  
  end

  # DELETE /funeventabstracts/1 or /funeventabstracts/1.json
  def destroy
    @funeventabstract.destroy

    respond_to do |format|
      format.html { redirect_to funeventabstracts_url, notice: "Funeventabstract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_funeventabstract
      @funeventabstract = @patient.funeventabstracts.build
    end
    def set_funeventabstract
      @funeventabstract = @patient.funeventabstracts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funeventabstract_params
      params.require(:funeventabstract).permit(:abstract,:patient_id)
    end
end
