require 'rails_helper'

RSpec.describe "baskets/index", type: :view do
  before(:each) do
    assign(:baskets, [
      Basket.create!(
        :user_id => 2,
        :product_id => 4,
        :quantity => 5
      ),
      Basket.create!(
        :user_id => 1,
        :product_id => 1,
        :quantity => 7
      )
    ])
  end

  it "renders a list of baskets" do
    render
    assert_select "tr>td", :text => 5.to_s, :count => 1
    assert_select "tr>td", :text => 7.to_s, :count => 1
  end
end
