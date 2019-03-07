class LineItemsController < ApplicationController
  include BasketsHelper
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.friendly.find(params[:product_id])
    puts "$" * 100
    puts product.id
    puts "$" * 100
    @line_item = @current_basket.add_product(product)



    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.basket, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @operator = params[:operator]
    respond_to do |format|
      if  @operator == "add"
        puts "##"*100
        puts @price
        puts "##"*100
        @line_item.update(:quantity => @line_item.quantity + 1 )
        @line_item_total = @line_item.product.price * @line_item.quantity.round(2)
        set_price
        format.html { redirect_to @line_item.basket, notice: 'Line item was successfully updated.' }
        format.js # { render :show, status: :ok, location: @line_item }
      elsif  @operator == "reduce"
        @line_item.update(:quantity => @line_item.quantity - 1)
        @line_item_total = @line_item.product.price * @line_item.quantity.round(2)
        set_price
        if @line_item.quantity == 0
          @line_item.destroy
        end
        format.html { redirect_to @line_item.basket, notice: 'Line item was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.basket, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:basket_id, :product_id, :quantity)
    end
end
