class Availability < ApplicationRecord
  belongs_to :service

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :available, inclusion: { in: [true, false] }
end
