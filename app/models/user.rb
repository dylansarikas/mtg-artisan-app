class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :decks
  # has_many :decks, depedent: :destroy

end
