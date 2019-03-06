module BasketsHelper
  def set_price
    @price = 0
    @basket.line_items.each do |item|
      @price += (item.product.price * item.quantity)
    end
    @price = @price.round(2)
  end
end
