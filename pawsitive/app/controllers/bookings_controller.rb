class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path, flash[:notice] 'Booking was successfully created.'
    else
      render :new
      flash[:alert] = 'Booking was not created.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :service_id, :num_of_pets, :start_date, :end_date, :start_time, :end_time, :phone_number, :message, :recieve_updates)
  end
end
