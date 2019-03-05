require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @product = FactoryBot.create(:product)
  end

  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@product).to be_a(Product)
    end

  end

  context "associations" do

  end

  context "public instance methods" do

  end

end
