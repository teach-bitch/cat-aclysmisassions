class LineItemsController < ApplicationController
  include CurrentBasket
  before_action :set_basket, only: [:create]
  before_action :set_line_item, only: [:new, :update, :destroy]

  def create  # add 1 product to basket
    product = Product.find(params[:product_id])
    @line_item = @basket.add_product(product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.basket, notice: 'Produit ajouté au panier.' }
      else
        format.html { render :new }
      end
    end
  end

  def update  # add or remove 1 product from basket
    if
      @line_item.quantity += 1
      @line_item.save
    else
      if @line_item.quantity - 1 == 0 # if quantity will be equal to 0 then destroy
        @line_item.destroy
      else
        @line_item.quantity -= 1  # else only subtract 1 to quantity
        @line_item.save
      end
    end
    respond_to do |format|
      format.html { redirect_to @line_item.basket, notice: 'Panier mis à jour.' }
    end
  end

  def destroy # destroy completely one type of product from the basket
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.basket, notice: 'Produit supprimé du panier.' }
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:basket_id, :product_id, :quantity)
    end
end
