class DeckSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name

  has_many :card_decks

  belongs_to :user
end
