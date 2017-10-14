class CoinsController < ApplicationController
  def index

  end
  def show
  end

  def update
    @coin = Coin.find(params[:id])
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to static_pages_portfolio_url, notice: 'Coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :root }
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
  # def set_coins
  #   @coin = Coin.find(params[:id])
  # end
  def coin_params
    params.require(:coin).permit(:id, :coinID, :email, :active, :amount)
  end
end
