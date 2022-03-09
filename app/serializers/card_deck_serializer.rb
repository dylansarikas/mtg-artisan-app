class CardDeckSerializer < ActiveModel::Serializer
  attributes :id, :deck_id, :multiverse_id, :card, :amount

  belongs_to :deck

end
