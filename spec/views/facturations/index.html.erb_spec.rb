require 'rails_helper'

RSpec.describe "facturations/index", type: :view do
  before(:each) do
    assign(:facturations, [
      Facturation.create!(
        :basket_id => 2,
        :price => 10
      ),
      Facturation.create!(
        :basket_id => 3,
        :price => 84
      )
    ])
  end

  it "renders a list of facturations" do
    render
    assert_select "tr>td", :text => 10.to_s, :count => 1
    assert_select "tr>td", :text => 84.to_s, :count => 1
  end
end
