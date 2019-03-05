require 'rails_helper'

RSpec.describe "facturations/new", type: :view do
  before(:each) do
    assign(:facturation, Facturation.new(
      :basket_id => 10,
      :price => 555
    ))
  end

  it "renders new facturation form" do
    render

    assert_select "form[action=?][method=?]", facturations_path, "post" do

      assert_select "input[name=?]", "facturation[price]"
    end
  end
end
