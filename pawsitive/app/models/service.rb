class Service < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  has_many :bookings, dependent: :destroy

  validates :service_type, presence: true, inclusion: { in: ["Day Care", "Boarding", "Sitting"] }
  validates :description, presence: true, length: { minimum: 10 , maximum: 500}
  validates :availability, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :member_id, presence: true

  scope :boarding, -> { where(service_type: "Boarding") }

  def self.filtered(filters)
    return Service.where(service_type: "Boarding") if filters.nil?
    Service.where(service_type: filters[:service_type])
      .where("price -> 'small_dog' BETWEEN ? AND ?", filters[:price][:min], filters[:price][:max])
      .where("availability >= ?", filters[:date])
  end
end
