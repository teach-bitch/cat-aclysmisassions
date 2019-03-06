class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :destroy]
  before_action :set_price, only: [:show]

  def show
  end

  def create
    @basket = Basket.new(basket_params)
    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
    end
  end

  private
    def set_basket
      @basket = Basket.find(params[:id])
    end

    def set_price
    	@price = 0
    	@basket.line_items.each do |item|
    		@price += (item.product.price * item.quantity)
    	end
    	@price = @price.round(2)
    end

    def basket_params
      params.require(:basket).permit(:quantity)
    end
end
