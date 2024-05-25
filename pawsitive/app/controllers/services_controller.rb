class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
    @service = Service.find_by(id: params[:id])
    if @service
      @availability = @service.availability.is_a?(String) ? JSON.parse(@service.availability) : @service.availability
      @member = User.find_by(id: @service.member_id)
    else
      redirect_to services_path, alert: @service.errors.full_messages
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
      flash[:alert] = @service.errors.full_messages.to_sentence
    end
    puts @service.errors.full_messages
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
  end

  def service_params
    params.require(:service).permit(:member_id, :service_type, :description, availability: {}, price: {}, size: {})
  end
end
