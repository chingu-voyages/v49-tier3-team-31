class NotificationMailer < ApplicationMailer
  default from: 'lincolngibson7@gmail.com'
  
  def notify_email(receiver, notification)
    @receiver = receiver
    @notification = notification
    mail(to: @receiver.email, subject: 'You have a new notification')
  end
end
