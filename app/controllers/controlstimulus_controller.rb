class ControlstimulusController < ApplicationController
  include SetAddicdatum
  before_action :set_addicdatum_addic 
  before_action :set_controlstimulu, only: %i[ show edit update ]
  before_action :set_new_controlstimulu, only: %i[ new create]

  # GET /diaries/1 or /diaries/1.json
  def index
      if @addicdatum.controlstimulus.where(created_at:Time.current.all_day).exists?
          redirect_to  patient_addicdatum_controlstimulu_path(id:@addicdatum.controlstimulus.where(created_at:Time.current.all_day).first.id)
      else
          redirect_to  new_patient_addicdatum_controlstimulu_path
      end
  end
  def show

  end

  def new
  end

  # GET /diaries/1/edit
  def edit
  end
  def create
      ActiveRecord::Base.transaction do
        logger.debug "Params received in controlstimulu_params: #{params.inspect}"
  
        if @controlstimulu.update(controlstimulu_params)
          redirect_to patient_addicdatum_controlstimulus_path notice: '更新が完了しました'
        else
          flash.now[:alert]="更新に失敗しました"
          raise ActiveRecord::Rollback # ロールバック
          redirect_to new_patient_addicdatum_controlstimulu_path
        end
      end    
    end
  
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in essay_params: #{params.inspect}"

      if @controlstimulu.update(controlstimulu_params)
        redirect_to patient_addicdatum_controlstimulu_path notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_addicdatum_controlstimulu_path
      end
    end    
  end

  private
    def set_new_controlstimulu
      @controlstimulu = @addicdatum.controlstimulus.build
    end
    def set_controlstimulu
      @controlstimulu = @addicdatum.controlstimulus.find(params[:id])
    end
    def controlstimulu_params
      params.require(:controlstimulu).permit(:addicdatum_id,:num)
    end
end

