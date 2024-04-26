class CounsellorsController < ApplicationController
  before_action :set_counsellor, only: %i[ show edit update frontCover]
  before_action :set_new_counsellor, only: %i[ new create]
  def frontCover
  end
  def new
  end
  def index
    if current_user.adminflag
      @counsellors=Counsellor.all.order(created_at: :desc)
    else
      @counsellors=Counsellor.where(hospital: current_user.counsellor.hospital).order(created_at: :desc)
    end
  end
  def show
    if current_user.directorflag?
      render 'show_director'
    end
  end

  def edit
  end
  
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in counsellor_params: #{params.inspect}"

      if @counsellor.user.update(counsellor_params)
        redirect_to counsellors_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        render :new
        raise ActiveRecord::Rollback # ロールバック
      end
    end    
  end
  
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in counsellor_params: #{params.inspect}"

      if @counsellor.user.update(counsellor_params)
        redirect_to counsellor_path, notice: '更新が完了しました'
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
  
  private
    def set_new_counsellor
      @counsellor=Counsellor.new
      @counsellor.build_user
    end
    def set_counsellor
      if current_user.directorflag?
        @counsellor = Counsellor.find(params[:id])
      else
        @counsellor = User.find(session[:user_id]).counsellor
      end
      #unless @counsellor
      #  redirect_to root_path, alert: "患者が見つかりません"
      #end
    end
    
    def counsellor_params
      if current_user.directorflag?
        if params[:action]=='create'
          params.require(:user).permit(:name, :email, :counsellorflag,:userstatus,:directorflag,:password,:password_confirmation, counsellor_attributes: [:id,:hospital]).merge(userstatus:1,counsellorflag:1)
        elsif params[:action]=='update'
          params.require(:user).permit(:name, :email,:userstatus,:directorflag,counsellor_attributes: [:id,:hospital])
        end
      else
        params.require(:user).permit(:name, :email, counsellor_attributes: [:id, :hospital])
      end
    end

    
    
end
