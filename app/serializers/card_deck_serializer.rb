class CardDeckSerializer < ActiveModel::Serializer
  attributes :id, :deck_id, :multiverse_id

  belongs_to :deck
end
