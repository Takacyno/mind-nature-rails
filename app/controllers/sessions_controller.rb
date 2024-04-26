class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end
  
  def create
    @user = User.find_by(email: session_params[:email])
    session[:user_id] = @user.id
    if @user&.authenticate(session_params[:password])
      if @user.adminflag?
        redirect_to frontCover_admin_path(@user), notice: 'ログインしました。'  
      elsif @user.counsellorflag?
        redirect_to frontCover_counsellor_path(@user.counsellor), notice: 'ログインしました。'  
      else
        redirect_to frontCover_patient_path(@user.patient), notice: 'ログインしました。'  
      end
      
    else
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end
  
  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
