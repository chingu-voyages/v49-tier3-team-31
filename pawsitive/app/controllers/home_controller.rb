class HomeController < ApplicationController
  def index
    @services = Service.boarding
  end
end
