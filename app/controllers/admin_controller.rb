class AdminController < ApplicationController
  before_action :set_user, only: %i[frontCover]

  def frontCover
  end
  private
    def set_user
        @user = User.find_by(id:session[:user_id])
    end
end
