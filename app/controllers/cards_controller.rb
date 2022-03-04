class CardsController < ApplicationController

  def index
    # response = HTTP.get("https://api.scryfall.com/cards/search?q=r<=uncommon+f:#{params[:format]}+#{params[:name]}")
    # response = HTTP.get("https://api.scryfall.com/cards/search?&q=rarity<%3Duncommon+f%3A#{params[:format]}+#{params[:name]}")
    # https://api.scryfall.com/cards/search?q=r<=uncommon+f:standard+monk
    # response = HTTP.get("https://api.scryfall.com/cards/search?order=cmc&q=c%3Ared+pow%3D3")
    response = HTTP.get("https://api.scryfall.com/cards/search?order=cmc&q=c%3A#{params[:color]}+pow%3D#{params[:power]}+f:#{params[:format]}+#{params[:name]}+r%3C=uncommon+t:#{params[:type]}")
    # render json: response
    render json: response.parse(:json)["data"][0]
  end

end
