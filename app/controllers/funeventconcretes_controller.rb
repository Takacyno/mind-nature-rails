class FuneventconcretesController < ApplicationController
  include SetPatient
  include SetAddicdatum
  include SetFuneventAbstract
  before_action :set_patient_addic
  before_action :set_addicdatum_addic
  before_action :set_funevent_abstract, only: %i[ show edit update new create]
  before_action :set_funeventconcrete, only: %i[ show edit update ]
  before_action :set_new_funeventconcrete, only: %i[ new create]

  # GET /funeventconcretes or /funeventconcretes.json
  def index
    @funeventabstract=@patient.funeventabstracts.all
    @funeventabstractComplete=[]
    @funeventabstractIncomplete=[]
    @funeventabstract.each  do |funeveab|
      if funeveab.funeventconcrete.present?
        @funeventabstractComplete.push(funeveab)
      else
        @funeventabstractIncomplete.push(funeveab)
      end
    end
  end

  # GET /funeventconcretes/1 or /funeventconcretes/1.json
  def show
  end

  # GET /funeventconcretes/new
  def new
  end

  # GET /funeventconcretes/1/edit
  def edit
  end

  # POST /funeventconcretes or /funeventconcretes.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @funeventconcrete.update(funeventconcrete_params)
        redirect_to patient_funeventconcretes_path(addicdatum_id:@addicdatum.id), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_funeventabstract_funeventconcrete_path(addicdatum_id:@addicdatum.id)
      end
    end    
  end

  # PATCH/PUT /funeventconcretes/1 or /funeventconcretes/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @funeventconcrete.update(funeventconcrete_params)
        redirect_to patient_funeventabstract_funeventconcrete_path(id:@funeventconcrete.id,funeventabstract_id:@funeventabstract.id,addicdatum_id:@addicdatum.id), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_funeventabstract_funeventconcrete_path(id:@funeventconcrete.id,funeventabstract_id:@funeventabstract.id,addicdatum_id:@addicdatum.id)
      end
    end  
  end

  # DELETE /funeventconcretes/1 or /funeventconcretes/1.json
  def destroy
    @funeventconcrete.destroy

    respond_to do |format|
      format.html { redirect_to funeventconcretes_url, notice: "Funeventconcrete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_funeventconcrete
      @funeventconcrete = @funeventabstract.build_funeventconcrete
    end
    def set_funeventconcrete
      @funeventconcrete = @funeventabstract.funeventconcrete
    end

    # Only allow a list of trusted parameters through.
    def funeventconcrete_params
      params.require(:funeventconcrete).permit(:concrete,:funeventabstract_id)
    end
end
