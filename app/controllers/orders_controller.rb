class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :edit]
  before_action :set_items, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def set_items
    @item = Item.find(params[:item_id])
  end 

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :district, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? 
      if @item.order.present? || current_user.id == @item.user_id
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end 
  end
end
