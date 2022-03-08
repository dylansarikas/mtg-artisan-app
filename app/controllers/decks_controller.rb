class DecksController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    deck = Deck.all
    render json:deck
  end

  def create
    deck = Deck.new(
      #current user
      user_id: current_user.id,
      name: params[:name]
    )
    if deck.save
      render json:deck
    else render json: { errors: deck.errors.full_messages }, status: :bad_request
    end
  end

  def show
    deck = Deck.find(params[:id])
    render json:deck
  end

  def update
    deck = Deck.find(params[:id])
    deck.name = params[:name] || deck.name
    if deck.save
      render json:deck
    else render json: { errors: deck.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    deck = Deck.find(params[:id])
    deck.destroy
    render json:{message: "The deck #{deck.name} was destroyed.  Do you feel good about yourself?"}
  end

end
