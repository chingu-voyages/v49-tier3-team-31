class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos, service: :amazon, dependent: :destroy
  has_one_attached :avatar, service: :amazon, dependent: :destroy

  has_many :services, foreign_key: "member_id"
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :notifications, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :bio, length: { maximum: 500 }
  enum role: { user: 0, member: 1 }

  # validates :country, presence: true
  # validates :state, inclusion: { in: -> (record) { record.states}, allow_blank: true}
  # validates :state, presence: { if: -> (record) { record.states.present?}}
  # validates :city, inclusion: { in: -> (record) { record.cities}, allow_blank: true }
  # validates :city, presence: { if: -> (record) { record.cities.present?}}

  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!')
    else
      '/default_image.jpeg'
    end
  end

  def display_name
    "#{self.first_name} #{self.last_name.first}."
  end

  def countries
    CS.countries.with_indifferent_access
  end

  def states
    CS.states(country).with_indifferent_access if country.present?
  end

  def cities
    CS.cities(state, country) || [] if state.present? && country.present?
  end

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(
        Rails.root.join('app', 'assets', 'images', 'default_image.jpeg')
      ),
      filename: 'default_image.jpeg',
      content_type: 'image/jpeg'
    )
  end
end
