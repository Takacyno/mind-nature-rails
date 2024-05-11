class FuneventreadsController < ApplicationController
  include SetPatient
  include SetAddicdatum
  include SetFuneventAbstract
  before_action :set_patient_addic
  before_action :set_addicdatum_addic
  before_action :set_funevent_abstract, only: %i[ show edit update new create]
  before_action :set_funeventread, only: %i[ show edit update ]
  before_action :set_new_funeventread, only: %i[ new create]

  # GET /funeventreads or /funeventreads.json
  def index
    @funeventreads=Funeventread.where(funeventabstract_id: @patient.funeventabstracts.ids).order(created_at: :desc)
  end
  def select
    @funeventabstractall=@patient.funeventabstracts.all
    @funeventabstracts=[]
    @funeventabstractall.each  do |funeveab|
      if funeveab.funeventconcrete.present?
        @funeventabstracts.push(funeveab)
      end
    end
  end
  # GET /funeventreads/1 or /funeventreads/1.json
  def show
  end

  # GET /funeventreads/new
  def new
  end

  # GET /funeventreads/1/edit
  def edit
  end

  # POST /funeventreads or /funeventreads.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in funeventread_params: #{params.inspect}"

      if @funeventread.update(funeventread_params)
        redirect_to patient_funeventreads_path(addicdatum_id:@addicdatum.id), notice: '登録が完了しました'
      else
        flash.now[:alert]="登録に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_funeventabstract_funeventread_path(addicdatum_id:@addicdatum.id)
      end
    end    
  end

  # PATCH/PUT /funeventreads/1 or /funeventreads/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in funeventread_params: #{params.inspect}"

      if @funeventread.update(funeventread_params)
        redirect_to patient_funeventabstract_funeventread_path(id:@funeventread.id,funeventabstract_id:@funeventabstract.id,addicdatum_id:@addicdatum.id), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_funeventabstract_funeventread_path(id:@funeventread.id,funeventabstract_id:@funeventabstract.id,addicdatum_id:@addicdatum.id)
      end
    end  
  end

  # DELETE /funeventreads/1 or /funeventreads/1.json
  def destroy
    @funeventread.destroy

    respond_to do |format|
      format.html { redirect_to funeventreads_url, notice: "Funeventread was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_funeventread
      @funeventread = @funeventabstract.funeventreads.build
    end
    def set_funeventread
      @funeventread = @funeventabstract.funeventreads.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funeventread_params
      params.require(:funeventread).permit(:funeventabstract_id,:word=>[])
    end
end
