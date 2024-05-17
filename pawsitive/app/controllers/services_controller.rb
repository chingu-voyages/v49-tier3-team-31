class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_service, only: [:show]

  # GET /services
  def index
  end

  def show
    @service = Service.find_by(id: params[:id])
    if @service
      @member = User.find_by(id: @service.member_id)
    else
      redirect_to services_path, alert: @service.errors.full_messages
    end
  end

  def new
  end

  def create
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
  end

  def service_params
    params.require(:service).permit(:service_type, :description, :availability, :price, :size)
  end
end
