class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = User.find_by(id: params[:id])
    if @user
      render :profile
    else
      redirect_to root_path, alert: "User not found."
    end
  end
end
