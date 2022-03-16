class DeckSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :card_decks

  belongs_to :user
end
