require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :title => "Sac à puces"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sac à puces/)
  end
end
