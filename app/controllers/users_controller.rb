class UsersController < ApplicationController

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json:user
  end

  def update
    user = User.find(params[:id])
    user.email = params[:email] || user.email
    user.username = params[:username] || user.username
    user.image_url = params[:image_url] || user.image_url
    user.save
    render json:user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json:{message: "The user #{user.username} was destroyed.  Do you feel good about yourself?"}
  end

end
