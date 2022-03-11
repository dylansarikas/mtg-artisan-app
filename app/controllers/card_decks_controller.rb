class CardDecksController < ApplicationController

  def create
    if (params[:amount] + Deck.find(params[:deck_id]).deck_size) < 101
      carddeck = CardDeck.new(
        deck_id: params[:deck_id],
        multiverse_id: params[:multiverse_id],
        amount: params[:amount]
      )
      if carddeck.save
        render json:carddeck
      else render json: { errors: carddeck.errors.full_messages }, status: :bad_request
      end
    else
      render json: {error: "Deck Cannot Exceed 100 total cards"}
    end
  end

  def update
    if (params[:amount] + CardDeck.find(params[:id]).deck.deck_size - CardDeck.find(params[:id]).amount) < 101
      carddeck = CardDeck.find(params[:id])
      if params[:amount] == 0
        carddeck.delete
        render json:{message: "The CardDeck #{carddeck.id} was destroyed.  Do you feel good about yourself?"}
      else
        carddeck.amount = params[:amount] || carddeck.amount
        if carddeck.save
          render json:carddeck
        else render json: { errors: carddeck.errors.full_messages }, status: :bad_request
        end
      end
    else
      render json: {error: "Deck Cannot Exceed 100 total cards"}
    end
  end

  def delete
    carddeck = CardDeck.find(params[:id])
    carddeck.destroy
    render json:{message: "The CardDeck #{carddeck.id} was destroyed.  Do you feel good about yourself?"}
  end

end
