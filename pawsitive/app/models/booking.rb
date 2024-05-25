class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user, foreign_key: :user_id
  has_many :messages, dependent: :destroy
  
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :service_id, presence: true
  validates :num_of_pets, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :phone_number, presence: false   # format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :message, presence: true, length: { maximum: 500 }
  validates :recieve_updates, inclusion: { in: [true, false] }
  validates :start_date, :end_date, presence: true 
  validates :start_time, :end_time, presence: true

  validate :end_date_after_start_date
  validate :end_time_after_start_time

  after_create :create_notification

  def receiver
    service.member
  end

  def sender
    user
  end

  private

  def create_notification
    Notification.create(user: self.receiver, notifiable: self, read: false)
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?
    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
