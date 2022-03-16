class Deck < ApplicationRecord

  has_many :card_decks
  
  belongs_to :user

  def deck_size
    size = 0
    card_decks.each do |card_deck|
      size += card_deck.amount
    end
    return size
  end

  # def username
  #   return object.user.username
  # end

end
