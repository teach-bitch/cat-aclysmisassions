require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :category_id => 2,
      :title => "Mini Mario",
      :description => "Nourissez-le bien avec des champignon et votre Mini Mario sera grand.",
      :price => 16.50,
      :quantity => 10,
      :reference => "ITS-ME-MARIO-000"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[quantity]"

      assert_select "input[name=?]", "product[reference]"
    end
  end
end
