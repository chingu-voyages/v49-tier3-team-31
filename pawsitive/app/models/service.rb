class Service < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  has_many :bookings, dependent: :destroy

  validates :service_type, presence: true, inclusion: { in: %w[Dog\ Sitting Dog\ Boarding Dog] }
  validates :description, presence: true, length: { minimum: 100 }
  validates :availability, presence: true
  validates :price, presence: true
  validates :size, presence: true

end
