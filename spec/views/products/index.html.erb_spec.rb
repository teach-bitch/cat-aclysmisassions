require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :category_id => 1,
        :title => "Baguette de sourcier",
        :description => "Vous vivez dans un desert ? Votre puit est à sec ? Il n'a pas plu depuis plus d'un mois ? Grâce à cette super baguette de sourcier fini les soucis.",
        :price => 99.99,
        :quantity => 2,
        :reference => "A-100-666"
      ),
      Product.create!(
        :category_id => 2,
        :title => "Chapiteau",
        :description => "Avec ce super chapiteau vos soirées n'auront jamais étaient aussi belles",
        :price => 27.99,
        :quantity => 9,
        :reference => "B-100-666"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Baguette de sourcier".to_s, :count => 1
    assert_select "tr>td", :text => "Chapiteau".to_s, :count => 1
    assert_select "tr>td", :text => "Vous vivez dans un desert ? Votre puit est à sec ? Il n'a pas plu depuis plus d'un mois ? Grâce à cette super baguette de sourcier fini les soucis.".to_s, :count => 1
    assert_select "tr>td", :text => "Avec ce super chapiteau vos soirées n'auront jamais étaient aussi belles".to_s, :count => 1
    assert_select "tr>td", :text => 99.99.to_s, :count => 1
    assert_select "tr>td", :text => 27.99.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 1
    assert_select "tr>td", :text => 9.to_s, :count => 1
    assert_select "tr>td", :text => "A-100-666".to_s, :count => 1
    assert_select "tr>td", :text => "B-100-666".to_s, :count => 1
  end
end
