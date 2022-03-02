class Deck < ApplicationRecord

  has_many :card_decks
  
  belongs_to :user

end
