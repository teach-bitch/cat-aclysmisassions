require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :category_id => 3,
      :title => "Réplique presque réelle de Tomb Raider",
      :description => "Nous savons que vous savez ce que vous allez en faire mais vous ne saviez peut être pas que nous savions que vous saviez. Produit très en tendance chez les hommes",
      :price => 69,
      :quantity => 69,
      :reference => "X-SHOGUN-TONIGHT-69-XXX"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[quantity]"

      assert_select "input[name=?]", "product[reference]"
    end
  end
end
