class User < ApplicationRecord
  has_many_attached :photos

  enum role: { user: 0, member: 1 }
end
