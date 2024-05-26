class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
    @service = Service.find_by(id: params[:id])
    if @service
      @availabilities = @service.availabilities.group_by(&:date) || {}
      @member = User.find_by(id: @service.member_id)
    else
      redirect_to services_path, alert: @service.errors.full_messages
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params.except(:availability))
    if @service.save
      process_availability(@service, service_params[:availability])
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

    def process_availability(service, availability_params)
    return unless availability_params

    availability_params.each do |day, times|
      start_time = Time.parse(times["open"])
      end_time = Time.parse(times["close"])

      # Create availability only for future dates starting from today
      (Date.today..(Date.today + 30)).each do |date|
        next unless date.send("#{day.downcase}?")

        # Check if there is an existing booking for this date and service
        existing_booking = Booking.where(service: service, start_date: date).exists?

        Availability.create!(
          service_id: service.id,
          date: date,
          start_time: start_time,
          end_time: end_time,
          available: !existing_booking
        )
      end
    end
  end
end
