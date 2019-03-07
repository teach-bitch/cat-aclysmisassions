class ImagesController < ApplicationController

  def create
    puts "*"*60
    puts "create Images controller"
    puts params
    puts "*"*60
    @product = Product.find(params[:product_id])
    @product.image.attach(params[:image])
    redirect_to(product_path(@product))
  end

end
