class HomeController < ApplicationController
  def index
    @members = User.members
  end
end
