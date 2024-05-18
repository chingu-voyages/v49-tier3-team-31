class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    current_user = User.find_by(id: params[:id])
  end

end
