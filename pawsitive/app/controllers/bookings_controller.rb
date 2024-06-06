class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :create_message]
  before_action :set_services, only: [:new, :create]

  def new
    @member = User.find_by(id: params[:user_id])
    @services = @member.services
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @services = Service.find_by(id: params[:member_id])
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @messages = @booking.messages.includes(:sender, :receiver).all
    @message = Message.new
  end

  def create_message
    @message = @booking.messages.build(message_params)
    @message.sender = current_user
    @message.receiver = @booking.user == current_user ? @booking.service.member : @booking.user

    if @message.save
      redirect_to booking_path(@booking), notice: 'Message sent successfully.'
    else
      @messages = @booking.messages.includes(:sender, :receiver)
      flash[:alert] = @message.errors.full_messages.to_sentence
      render :show
    end
  end
  
  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def update_status
    if @booking.service.member_id == current_user.id
      @booking.update(status: params[:status])
      redirect_to booking_path(@booking), notice: 'Booking updated successfully.'
    else
      redirect_to booking_path(@booking), alert: 'You are not authorized to update this booking.'
    end
  end

  private
  
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_services
    @services = Service.all
  end

  def booking_params
    params.require(:booking).permit(:service_id, :num_of_pets, :start_date, :end_date, :start_time, :end_time, :phone_number, :message, :recieve_updates)
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def authorize_user!
    unless @booking.user_id == current_user.id
      redirect_to root_path, alert: 'You are not authorized to edit this booking.'
    end
  end
end
