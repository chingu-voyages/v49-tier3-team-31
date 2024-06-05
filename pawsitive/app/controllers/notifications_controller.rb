class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification, only: [:show, :mark_as_read]

  def index
    @notifications = @user.notifications.order(created_at: :desc)
  end

  def show
    if @notification.notifiable_type == 'Message'
      @message = @notification.notifiable
      @booking = @message.booking
    elsif @notification.notifiable_type == 'Booking'
      @booking = @notification.notifiable
      @messages = @booking.messages
    end
  end

  def mark_as_read
    @notification.update(read: true)
    redirect_to notifications_path, notice: 'Notification marked as read.'
  end

  def unread_count
    count = @user.notifications.unread.count
    render json: { count: count }
  end

  private

  def set_notification
    @notification = @user.notifications.find(params[:id])
  end
end
