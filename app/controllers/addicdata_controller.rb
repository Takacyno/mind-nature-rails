class AddicdataController < ApplicationController
  include SetPatient
  before_action :set_patient_addic 
  before_action :set_addicdatum, only: %i[ edit update show]
  before_action :set_new_addicdatum, only: %i[ new create]
  
  def index
    @addicdata=@patient.addicdata
  end

  def show
  end

  def new
    @newaddiction={}
    @index=[]
    I18n.t('addiction').each.with_index(1) do |addiction,index|
      @index.push(index)
    end
    @patient.addicdata.each do |addicdatum|
      @index.delete(addicdatum.what)
    end
    @index.each do |index|
      @newaddiction[index]=I18n.t("addiction.#{index}") 
    end
  end

  def edit
  end
  
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @addicdatum.update(addicdatum_params)
        redirect_to patient_addicdata_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_addicdatum_path
      end
      
    end    
  end

  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @addicdatum.update(addicdatum_params)
        redirect_to patient_addicdatum_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to patient_addicdatum_path
      end
    end    
  end
  
  private
    def set_new_addicdatum
      @addicdatum = @patient.addicdata.build
    end
    def set_addicdatum
      @addicdatum = @patient.addicdata.find(params[:id])
    end
    def addicdatum_params
      if params[:action]=='create'
        params.require(:addicdatum).permit(
        :what,
        :severity,
        :progress,
        :difficulties,
        :frequency,
        :trouble,
        :method,
        :goal,
        :controlstimulustext,
        :controlstimulusinstruction,
        :pseudoactinstruction,
        :imaginationinstruction,
        :essay,
        :supplement,
        :patient_id
        )
      else
        params.require(:addicdatum).permit(
          :severity,
          :progress,
          :difficulties,
          :frequency,
          :trouble,
          :method,
          :goal,
          :controlstimulustext,
          :controlstimulusinstruction,
          :pseudoactinstruction,
          :imaginationinstruction,
          :essay,
          :supplement,
          :patient_id
          )
      end
    end
 
end
