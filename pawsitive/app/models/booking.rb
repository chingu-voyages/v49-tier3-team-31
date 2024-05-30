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
  after_create :update_availability

  def receiver
    service.member
  end

  def sender
    user
  end

  private

  def create_notification
    notification = Notification.create(user: self.receiver, notifiable: self, read: false)
    NotificationMailer.notify_email(self.receiver, notification).deliver_now
  end

  def update_availability
    (start_date..end_date).each do |date|
      availability = Availability.find_by(service: service, date: date)
      if availability && within_booking_time?(availability)
        availability.update(available: false)
      end
    end
  end

  def within_booking_time?(availability)
    booking_start = Time.parse("#{start_date} #{start_time}")
    booking_end = Time.parse("#{end_date} #{end_time}")
    availability_start = Time.parse("#{availability.date} #{availability.start_time}")
    availability_end = Time.parse("#{availability.date} #{availability.end_time}")

    (booking_start >= availability_start && booking_start < availability_end) ||
      (booking_end > availability_start && booking_end <= availability_end) ||
      (booking_start <= availability_start && booking_end >= availability_end)
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?
    if end_date == start_date && end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
