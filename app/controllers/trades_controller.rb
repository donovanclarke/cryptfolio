class TradesController < ApplicationController
  def list
    @coin = Coin.select('*').where('email = ?', current_user.email)

    @buy = CoinBuy.select('*').where('email = ?', current_user.email)
    @sell = CoinSell.select('*').where('email = ?', current_user.email)

  end

  def create
    if params[:trades] == 'true'
      @trades = CoinBuy.new(trade_params)

      respond_to do |format|
        if @trades.save
          format.html { redirect_to trades_list_url, notice: 'Trade sucessfully saved.' }
          format.json { render :home, status: :created, location: @coin}
        else
          format.html { render :list}
          format.json { render json: @coin.errors, status: :unprocessable_entity }
        end
      end
    else
      @trades = CoinSell.new(trade_params)

      respond_to do |format|
        if @trades.save
          format.html { redirect_to trades_list_url, notice: 'Trade sucessfully saved.' }
          format.json { render :home, status: :created, location: @trades}
        else
          format.html { render :list}
          format.json { render json: @trades.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  private

  def trade_params
    params.require(:trade).permit(:coinID, :email, :amount, :price)
  end
end
