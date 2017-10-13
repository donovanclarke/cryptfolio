class CoinsController < ApplicationController
  def destroy
    @coin = Coin.find(params[:id])

    @coin.destroy
    redirect_to static_pages_portfolio_path
    # respond_to do |format|
    #   format.html { redirect_to coins_url, notice: 'You have sucessfully removed coin.' }
    #   format.json { head :no_content }
    # end
  end
end
