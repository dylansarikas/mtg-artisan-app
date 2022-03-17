class DeckSerializer < ActiveModel::Serializer
  attributes :id, :name

  attribute :owner, if: :current_user

  has_many :card_decks

  belongs_to :user

  def owner
    current_user.id == object.user_id
  end
end
