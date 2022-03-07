class CardDeck < ApplicationRecord

  belongs_to :deck

  def card
    response = HTTP.get("https://api.scryfall.com/cards/multiverse/#{multiverse_id}")
    cardboard = response.parse(:json)
    return {
      name: cardboard["name"],
      multiverse: cardboard["multiverse_ids"],
      image: cardboard["image_uris"]["normal"]
    }

  end

end
