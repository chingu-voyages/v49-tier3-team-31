class Service < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :reviews

  validates :service_type, presence: true, inclusion: { in: ["Day Care", "Boarding", "Sitting"] }
  validates :description, presence: true, length: { minimum: 10 , maximum: 200}
  validates :price, presence: true
  validates :size, presence: true
  validates :member_id, presence: true
  validates :pet_number, presence: true, inclusion: { in: ["1", "2", "3+"] }
  validates :pet_types, presence: true

  scope :boarding, -> { where(service_type: "Boarding") }

  def self.filtered(filters, lat = 37.3897, long = -122.0832)
    return Service.where(service_type: "Boarding").where(member_id: User.near(lat, long).pluck(:id)) if filters.nil?
    Service.where(service_type: filters[:service_type]).where(member_id: User.near(lat, long).pluck(:id))
      .where("price -> 'small_dog' BETWEEN ? AND ?", filters[:price][:min], filters[:price][:max])
      .where_pet_number(filters[:pet_number])
      .where_pet_types(filters[:pet_types])
      #.joins(:availabilities).where(availabilities: {date: filters[:dates][:start]..filters[:dates][:end]})
      #.where_size(filters[:dog_size])
  end

  def self.where_dates(dates)
  end

  def self.where_pet_number(pet_number)
    return self.all if pet_number.nil?
    self.where(pet_number: pet_number.to_i..)
  end

  def self.where_pet_types(pet_types)
    array = []
    pet_types[:dog] == "1" && array << "dog"
    pet_types[:cat] == "1" && array << "cat"
    return self.all if array.length.zero?
    self.where("pet_types @> ARRAY[?]::varchar[]", array)
  end

  def self.where_size(size)
    return self.all if size.values == ["0", "0", "0", "0"]
    self
      #.where("size -> 'small' ? '0-15 lb'")
      .where("size -> 'medium' ? '16-30 lb'")
      #.where("size -> 'medium' = '16-40 lb' AND '1' = ?", size[:m])
  end
end
