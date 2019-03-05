require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :title => "Charme"
      ),
      Category.create!(
        :title => "Comique"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Charme".to_s, :count => 1
    assert_select "tr>td", :text => "Comique".to_s, :count => 1
  end
end
