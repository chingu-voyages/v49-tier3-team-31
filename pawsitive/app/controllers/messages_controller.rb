class MessagesController < ApplicationController
  before_action :set_booking
  before_action :set_message, only: [:show]

  def show
    redirect_to booking_path(@booking, anchor: "message-#{@message.id}")
  end

  def create
    @message = @booking.messages.build(message_params)
    @message.sender = current_user
    @message.receiver = (@booking.user == current_user) ? @booking.service.member : @booking.user

    if @message.save
      redirect_to booking_path(@booking), notice: 'Message sent successfully.'
    else
      redirect_to booking_path(@booking), alert: @message.errors.full_messages
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
