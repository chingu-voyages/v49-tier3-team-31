class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    current_user = User.find_by(id: params[:id])
  end

  def new
    @User = user.new user_params
  end

private
  def user_params
    params.require(:user).permit(:country, :state, :city, :address, :zip, :birthday )
  end
end
