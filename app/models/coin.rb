class Coin < ApplicationRecord
  require 'httparty'

  def self.Cryptocoinprice
    arr = []
    Coin.find_each do |item|
      coinID = item.coinID
      response = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{coinID}");
      arr.push response[0]['price_usd']
    end
  end
end
