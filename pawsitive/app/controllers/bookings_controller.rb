class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @services = Service.all
    puts @services.inspect
  end

  def create
    @booking = Booking.new(booking_params)
    @services = Service.all
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :num_of_pets, :start_date, :end_date, :start_time, :end_time, :phone_number, :message, :recieve_updates)
  end
end

