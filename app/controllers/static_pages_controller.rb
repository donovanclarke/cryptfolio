class StaticPagesController < ApplicationController
  require 'httparty'

  def home
    @response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/',
    :headers => {'Content-Type' => 'application/json'} )
  end

  def list
  end

  def portfolio
  end
  def settings
  end
end
