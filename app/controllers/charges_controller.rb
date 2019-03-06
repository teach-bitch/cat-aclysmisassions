class ChargesController < ApplicationController
  include BasketsHelper
  before_action :set_price
  before_action :set_amount

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    # Amount in cents
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

  private

  def set_amount
    @amount = (@price * 100).to_i
  end
end
