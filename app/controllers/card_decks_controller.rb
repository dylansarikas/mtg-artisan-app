class CardDecksController < ApplicationController

  def create
    carddeck = CardDeck.new(
      deck_id: params[:deck_id],
      multiverse_id: params[:multiverse_id],
      amount: params[:amount]
    )
    if carddeck.save
      render json:carddeck
    else render json: { errors: carddeck.errors.full_messages }, status: :bad_request
    end
  end

  def update
    carddeck = CardDeck.find(params[:id])
    carddeck.amount = params[:amount] || carddeck.amount
    if carddeck.save
      render json:carddeck
    else render json: { errors: carddeck.errors.full_messages }, status: :bad_request
    end
  end

  def delete
    carddeck = CardDeck.find(params[:id])
    carddeck.destroy
    render json:{message: "The CardDeck #{carddeck.id} was destroyed.  Do you feel good about yourself?"}
  end

end
