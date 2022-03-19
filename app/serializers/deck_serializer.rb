class DeckSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_card

  attribute :owner, if: :current_user

  has_many :card_decks

  belongs_to :user

  def owner
    current_user.id == object.user_id
  end

  def first_card
    if object.card_decks.first
      object.card_decks.first.card
    else
      {}
    end
  end
end
