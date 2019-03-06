class ChargesController < ApplicationController
  include BasketsHelper
  before_action :set_price

  def new
  end

  def create
    # Amount in cents
    puts "$" * 100
    puts @price
    puts "$" * 100
    @amount = @price * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
