require 'rails_helper'

RSpec.describe "facturations/edit", type: :view do
  before(:each) do
    @facturation = assign(:facturation, Facturation.create!(
      :basket_id => 1,
      :price => 19.99
    ))
  end

  it "renders the edit facturation form" do
    render

    assert_select "form[action=?][method=?]", facturation_path(@facturation), "post" do

      assert_select "input[name=?]", "facturation[price]"
    end
  end
end
