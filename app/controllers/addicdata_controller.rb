class AddicdataController < ApplicationController
  include SetPatient
  before_action :set_patient_addic
  #before_action :set_addicdata, only: %i[ show edit update frontCover]
  #before_action :set_new_addicdata, only: %i[ new create]
  
  def index
    if current_user.adminflag
      @patients=Patient.all.order(created_at: :desc)
    else
      @patients=Patient.where(hospital: current_user.counsellor.hospital).order(created_at: :desc)
    end
  end

  def show
    @addicdatum = @patient.addicdatum.find_by(what: params[:button_name])
    redirect_to new_patient_addicdatum_path(@patient) unless @addicdatum
  end

  def new
    @addicdatum = Addicdatum.new
    @addicdatum.what=params[:button_name]
    render 'patients/addicdata/new'
  end

  def edit
    if current_user.counsellorflag?
      render 'edit_counsellor'
    end
  end
  
  def create
    @addicdatum = Addicdatum.new
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @addicdatum.update(addicdatum_params)
        redirect_to patient_addicdatum_path(@patient), notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        render new
        
      end
      raise ActiveRecord::Rollback unless @addicdatum.persisted?
    end    
  end

  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @patient.user.update(patient_params)
        redirect_to patient_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        render :edit
        raise ActiveRecord::Rollback # ロールバック
      end
    end    
  end
  
  private
    def set_new_addicdata
      @addicdata=Addicdata.new
    end

    def addicdatum_params
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
      ).merge(what: params[:button_name])
      
    end

    
    
end
