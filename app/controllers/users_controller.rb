class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    p "In create-----------------------------------------------------!!!"
    sleep 2
    tokens = RestClient.where(:email => params['email']).first
    render json: tokens
  end

  def update
  end

  def destroy
  end
end
