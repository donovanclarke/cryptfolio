class StaticPagesController < ApplicationController
  require 'httparty'
  require 'will_paginate/array'

  def home
  end

  def list
    response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/',
    :headers => {'Content-Type' => 'application/json'} )
    @response = response.paginate(page: params[:page], per_page: 10)

    @search = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/');

  end

  def portfolio
    @coins = Coin.select('*').where('email = ?', current_user.email)
  end

  def settings
  end

  def create
    response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/',
    :headers => {'Content-Type' => 'application/json'} )
    @response = response.paginate(page: params[:page], per_page: 10)
    @search = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/');

    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to static_pages_portfolio_path, notice: 'Coin was successfully added to portfolio.' }
        format.json { render :home, status: :created, location: @coin}
      else
        format.html { render :list}
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coin = Coin.find(params[:id])

    @coin.destroy
    redirect_to static_pages_portfolio_path
    # respond_to do |format|
    #   format.html { redirect_to coins_url, notice: 'You have sucessfully removed coin.' }
    #   format.json { head :no_content }
    # end
  end

  private

  def coin_params
    params.require(:coin).permit(:coinID, :email, :active)
  end
end
