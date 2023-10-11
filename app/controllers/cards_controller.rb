class CardsController < ApplicationController

  def index

    #This allows users to seach for cards by name, card text, card type, or color

    request = "https://api.scryfall.com/cards/search?order=name&q="
    if params[:name]
      request += params[:name] + "+"
    end

    if params[:text]
      request += "o:" + params[:text] + "+"
    end

    if params[:type]
      request += "type:" + params[:type] + "+"
    end

    if params[:color]
      request += "color%3E=" + params[:color] + "+"
    end

    request = request.chop
    
    puts request

    response = HTTP.get(request)
    
    render json: response.parse(:json)
  end

end
