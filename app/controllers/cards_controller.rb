class CardsController < ApplicationController

  def index
    response = HTTP.get("https://api.scryfall.com/cards/search?order=cmc&q=c%3A#{params[:color]}+pow%3D#{params[:power]}+f:#{params[:format]}+#{params[:name]}+r%3C=uncommon+t:#{params[:type]}")
    
    render json: response.parse(:json)
  end

end
