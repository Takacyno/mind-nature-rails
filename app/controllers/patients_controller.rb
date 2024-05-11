class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update frontCover]
  before_action :set_new_patient, only: %i[ new create]
  def frontCover
  end
  def new
  end
  def index
    if current_user.adminflag
      @patients=Patient.all.order(created_at: :desc)
    else
      @patients=Patient.where(hospital: current_user.counsellor.hospital).order(created_at: :desc)
    end
  end
  def show
    @holiday_string=generate_holiday_string(@patient.holiday)
    if current_user.counsellorflag?
      render 'show_counsellor'
    end
  end

  def edit
    if current_user.counsellorflag?
      render 'edit_counsellor'
    end
  end
  
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in counsellor_params: #{params.inspect}"

      if @patient.user.update(patient_params)
        redirect_to patients_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        render :new
        raise ActiveRecord::Rollback # ロールバック
      end
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
  
  def generate_holiday_string(holiday)
    result = ""    
    holiday.each do |index|
      result += I18n.t("date.abbr_day_names.#{index}") + " "
    end
    return result
  end

  def generate_addiction_string(addiction)
    result = ""    
    @patient.addicdata.each do |index|
      result += I18n.t("addiction.#{index.what}") + " "
    end
    return result
  end

  private
    def set_new_patient
      @patient=Patient.new
      @patient.build_user
    end

    def set_patient
      if current_user.counsellorflag?
        #view_directory=File.dirname(request.path)
        #case view_directory
        #when "/patients"
        #  @patient = Patient.find(params[:id])
        #else
          @patient = Patient.find(params[:id])
        #end
      else
        @patient = User.find(session[:user_id]).patient
      end
      #unless @patient
      #  redirect_to root_path, alert: "患者が見つかりません"
      #end
    end
    
    def patient_params
      if current_user.adminflag?
        if params[:action]=='create'
          params.require(:user).permit(:name, :email,:userstatus,:password,:password_confirmation, patient_attributes: [ :id,:hospital,:age,:sex,:residence,:rhythmoflife,:interests,:profession,:workexp,:harshchildhoodexp,:criminalrecord,:othertraumas,:supplement,:goal, :holiday => [], :testshow => []]).merge(userstatus:1)
        elsif params[:action]=='update'
          params.require(:user).permit(:name, :email,:userstatus, patient_attributes: [ :id,:hospital,:age,:sex,:residence,:rhythmoflife,:interests,:profession,:workexp,:harshchildhoodexp,:criminalrecord,:othertraumas,:supplement,:goal, :holiday => [], :testshow => []])
        end
      elsif current_user.counsellorflag?
        if params[:action]=='create'
          params.require(:user).permit(:name, :email,:userstatus,:password,:password_confirmation, patient_attributes: [ :id,:age,:sex,:residence,:rhythmoflife,:interests,:profession,:workexp,:harshchildhoodexp,:criminalrecord,:othertraumas,:supplement,:goal, :holiday => [], :testshow => []]).merge(userstatus:1)
        elsif params[:action]=='update'
          params.require(:user).permit(:name, :email,:userstatus, patient_attributes: [ :id,:age,:sex,:residence,:rhythmoflife,:interests,:profession,:workexp,:harshchildhoodexp,:criminalrecord,:othertraumas,:supplement,:goal, :holiday => [], :testshow => []])
        end     
      else
        params.require(:user).permit(:name, :email, patient_attributes: [:residence, :id, :holiday => []])
      end
    end

    
    
end
