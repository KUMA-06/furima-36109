class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @history_buy = HistoryBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @history_buy = HistoryBuy.new(history_buy_params)
    if @history_buy.valid?
      @history_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_buy_params
    params.require(:history_buy).permit(:postal, :area_id, :municipality, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end