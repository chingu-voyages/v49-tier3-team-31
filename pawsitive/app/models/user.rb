class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many_attached :photos, service: :amazon, dependent: :destroy
  has_one_attached :avatar, service: :amazon, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validates :role, presence: true
  enum role: { user: 0, member: 1 }
end
