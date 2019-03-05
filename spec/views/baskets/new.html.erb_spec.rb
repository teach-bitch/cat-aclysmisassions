require 'rails_helper'

RSpec.describe "baskets/new", type: :view do
  before(:each) do
    assign(:basket, Basket.new(
      :user_id => 2,
      :product_id => 4,
      :quantity => 1
    ))
  end

  it "renders new basket form" do
    render

    assert_select "form[action=?][method=?]", baskets_path, "post" do

      assert_select "input[name=?]", "basket[quantity]"
    end
  end
end
