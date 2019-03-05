require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :category_id => 1,
      :title => "Sha",
      :description => "Ce superbe sha vous permettra de faire le voyage vers une version incroyable.",
      :price => 1,
      :quantity => 1,
      :reference => "X-69-X"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sha/)
    expect(rendered).to match(/Ce superbe sha vous permettra de faire le voyage vers une version incroyable./)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/X-69-X/)
  end
end
