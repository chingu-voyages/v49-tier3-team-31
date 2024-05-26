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

  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!')
    else
      '/default_image.jpeg'
    end
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
