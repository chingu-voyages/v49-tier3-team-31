class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    current_user = User.find_by(id: params[:id])
  end
end
