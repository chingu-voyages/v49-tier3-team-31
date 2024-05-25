class Message < ApplicationRecord
  belongs_to :booking
  belongs_to :sender, class_name: 'User',foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User',foreign_key: 'receiver_id'

  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :content, presence: true

  after_create :create_notification

  private

  def create_notification
    sender_notification = Notification.create(user: self.sender, notifiable: self, read: false)
    receiver_notification = Notification.create(user: self.receiver, notifiable: self, read: false)
    
    # Optionally, you can associate the notifications with both sender and receiver
    self.notifications << sender_notification
    self.notifications << receiver_notification
  end
end
