class CardsController < ApplicationController

  def index
    # response = HTTP.get("https://api.scryfall.com/cards/search?order=name&q=#{params[:name]}")

    # response = HTTP.get("https://api.scryfall.com/cards/search?order=name&q=#{params[:name]}+o:#{params[:oracle]}")

    ### This works
    # response = HTTP.get("https://api.scryfall.com/cards/search?order=name&q=#{params[:name]}+o:#{params[:oracle]}+type:#{params[:type]}+color%3E=#{params[:color]}")

    ### Testing Here
    # puts "HERE HERE HERE HERE HERE HERE HERE"
    # puts "#{params[:name]} + #{params[:text]} + #{params[:type]} + #{params[:color]}"
    # response = HTTP.get("https://api.scryfall.com/cards/search?order=name&q=#{params[:name]}+o:#{params[:text]}+type:#{params[:type]}+color%3E=#{params[:color]}")

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
    
    puts "HERE HERE HERE HERE HERE HERE HERE"
    puts request

    response = HTTP.get(request)

    ### Power Search
    # response = HTTP.get("https://api.scryfall.com/cards/search?order=cmc&q=c%3A#{params[:color]}+pow%3D#{params[:power]}+f:#{params[:format]}+#{params[:name]}+r%3C=uncommon+t:#{params[:type]}")
    
    ### Fuzzy Search
    # response = HTTP.get("https://api.scryfall.com/cards/named?fuzzy=#{params[:search]}")
    
    render json: response.parse(:json)
  end

end
