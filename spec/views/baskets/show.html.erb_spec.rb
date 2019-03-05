require 'rails_helper'

RSpec.describe "baskets/show", type: :view do
  before(:each) do
    @basket = assign(:basket, Basket.create!(
      :user_id => 1,
      :product_id => 3,
      :quantity => 37
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/37/)
  end
end
