module CurrentBasket
	private

	def set_basket
		@basket = Basket.find_by(id: session[:basket_id]) || Basket.create
		session[:basket_id] ||= @basket.id
	end
end