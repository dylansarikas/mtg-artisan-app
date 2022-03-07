class CardDeckSerializer < ActiveModel::Serializer
  attributes :id, :deck_id, :multiverse_id, :card

  belongs_to :deck

end
