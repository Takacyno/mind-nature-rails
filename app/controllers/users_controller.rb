class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update frontCover_patient frontCover_admin]
  def index_patients
    if current_user.admin
      @patients=User.where(userable_type: "Patient").order(created_at: :desc)
    else
      @patients=User.where(userable_type: "Patient").where(patient: {hospital: current_user.counsellor.hospital}).order(created_at: :desc)
    end
  end
  def index_counsellors
  end
  def frontCover_admin
  end
  def frontCover_patient
  end
  
  def show
    @holiday_string=generate_holiday_string(@patient.patient.holiday)
    if current_user.admin?
      render 'show_patient_admin'
    elsif current_user.counsellor?
      render 'show_patient_counsellor'
    else
      render 'show_patient' 
    end
  end

  def edit
    if current_user.admin?
      render 'edit_admin'
    elsif current_user.counsellor?
      render 'edit_counsellor'
    else
      render 'edit_patient' 
    end
  end
  
  def create
    view_directory=File.dirname(request.path)
    case view_directory
    when "/counsellors"
      ActiveRecord::Base.transaction do
        logger.debug "Params received in counsellor_params: #{params.inspect}"
        @counsellor=Counsellor.new
        @counsellor.build_user
        if @counsellor.user.update(counsellor_params)
          redirect_to counsellor_path, notice: '更新が完了しました'
        else
          flash.now[:alert]="更新に失敗しました"
          redirect_to new_counsellor_path
          raise ActiveRecord::Rollback # ロールバック
        end
      end   
    end 
  end
  
  def update
    view_directory=File.dirname(request.path)
    case view_directory
    when "/patients"
      ActiveRecord::Base.transaction do
        logger.debug "Params received in patient_params: #{params.inspect}"
        patient=Patient.find(params[:id])
        if patient.update(patient_params)
          redirect_to patient_path, notice: '更新が完了しました'
        else
          flash.now[:alert]="更新に失敗しました"
          render :edit_patient
          raise ActiveRecord::Rollback # ロールバック
        end
      end      

    when "/admin/users"
      # admin/usersディレクトリから呼ばれた場合の処理
    else
      # その他のディレクトリから呼ばれた場合の処理
    end
    
  end
  
  def generate_holiday_string(holiday)
    result = ""    
    holiday.each do |index|
      result += I18n.t("date.abbr_day_names.#{index}") + " "
    end
    return result
  end
  
  private
    def set_user
      @user = User.find_by(id:session[:user_id])
    end
    
    def patient_params
      params.require(:user).permit(:name, :email, patient_attributes: [:residence, :id, :holiday => []])
    end

    def counsellor_params
      if current_user.adminflag?
        params.require(:user).permit(:name, :email,:directorflag,:password,:password_confirmation, counsellor_attributes: [:id,:hospital]).merge(userstatus:1)
      elsif current_user.directorflag?

      else
        params.require(:user).permit(:name, :email, counsellor_attributes: [:residence, :id, :holiday => []])
      end
    end
    
    
end
