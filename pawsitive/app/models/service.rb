class Service < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  has_many :bookings, dependent: :destroy

  validates :service_type, presence: true, inclusion: { in: %w[Dog\ Sitting Dog\ Boarding Dog] }
  validates :description, presence: true, length: { minimum: 100 }
  validates :availability, presence: true
  validates :price, presence: true
  validates :size, presence: true

  scope :boarding, -> { where(service_type: "Dog Boarding") }

  def self.filtered(filters)
    Service.where(service_type: filters[:service_type])
      .where("price -> 'base_rate' BETWEEN ? AND ?", filters[:price][:min], filters[:price][:max])
  end
end
