require 'rails_helper'

RSpec.describe "facturations/show", type: :view do
  before(:each) do
    @facturation = assign(:facturation, Facturation.create!(
      :basket_id => 3,
      :price => 9000
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9000/)
  end
end
