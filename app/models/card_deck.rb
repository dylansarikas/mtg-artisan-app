class CardDeck < ApplicationRecord

  belongs_to :deck

  def card
    picture = ""
    response = HTTP.get("https://api.scryfall.com/cards/multiverse/#{multiverse_id}")
    cardboard = response.parse(:json)
    if cardboard["card_faces"]
      picture = cardboard["card_faces"][0]["image_uris"]["small"]
    else
      picture = cardboard["image_uris"]["small"]
    end
    return {
      name: cardboard["name"],
      multiverse: cardboard["multiverse_ids"],
      scryfall: cardboard["scryfall_uri"],
      image: picture
    }
    # return cardboard

  end

end
