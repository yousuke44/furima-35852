class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
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
  end

  def move_to_root_path
    redirect_to root_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path unless @item.order.blank?
  end
end
