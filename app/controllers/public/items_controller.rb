class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  def costomer_cart_items
    if current_customer.present?
      @cart_item = current_customer.cart_items
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
