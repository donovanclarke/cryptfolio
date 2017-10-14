class TradesController < ApplicationController
  def list
    @coin = Coin.select('*').where('email = ?', current_user.email)

    @buy = CoinBuy.select('*').where('email = ?', current_user.email)
    @sell = CoinSell.select('*').where('email = ?', current_user.email)

    @buyAmount = CoinBuy.select('*').where('email = ?', current_user.email).group('coinID')
    @sellAmount = CoinSell.select('*').where('email = ?', current_user.email).group('coinID')

    buyTotal = @buyAmount.sum(:price)
    sellTotal = @sellAmount.sum(:price)
    profitTotal = sellTotal.merge(buyTotal) { |k, v1, v2| v1 - v2 }

    @buyTotal = buyTotal.to_a
    @sellTotal = sellTotal.to_a
    @profitTotal = profitTotal.to_a
  end

  def create
    if params[:trades] == 'true'
      @trades = CoinBuy.new(trade_params)
    else
      @trades = CoinSell.new(trade_params)
    end
    respond_to do |format|
      if @trades.save
        format.html { redirect_to trades_list_url, notice: 'Trade sucessfully saved.' }
        format.json { render :home, status: :created, location: @coin}
      else
        format.html { render :list}
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def trade_params
    params.require(:trade).permit(:coinID, :email, :amount, :price)
  end
end
