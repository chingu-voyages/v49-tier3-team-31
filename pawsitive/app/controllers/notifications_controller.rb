class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def show
    @notification = Notification.find(params[:id])
    if @notification.notifiable_type == 'Message'
      @message = @notification.notifiable
      @booking = @message.booking
    elsif @notification.notifiable_type == 'Booking'
      @booking = @notification.notifiable
      @messages = @booking.messages
    end
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    render json: { success: true }
  end

  def unread_count
    count = current_user.notifications.unread.count
    render json: { count: count }
  end
end
