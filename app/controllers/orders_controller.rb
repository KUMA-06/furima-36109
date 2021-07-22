class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :redirect_check

  def index
    item_find
    @history_buy = HistoryBuy.new
  end

  def create
    item_find
    @history_buy = HistoryBuy.new(history_buy_params)
    if @history_buy.valid?
      pay_item
      @history_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_buy_params
    params.require(:history_buy).permit(:postal, :area_id, :municipality, :address, :building, :phone, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: history_buy_params[:price],
      card: history_buy_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_check
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.history.present?
      redirect_to root_path
    end
  end
end
