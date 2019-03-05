require 'rails_helper'

RSpec.describe Facturation, type: :model do

  before(:each) do
    @facturation = FactoryBot.create(:facturation)
  end

  it "has a valid factory" do
    expect(build(:facturation)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@facturation).to be_a(Facturation)
    end

  end

  context "associations" do

  end

  context "public instance methods" do

  end

end
