require 'rails_helper'

RSpec.describe BasketsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Basket. As you add validations to Basket, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {user_id: 1,
     product_id: 2,
     quantity: 72}
  }

  let(:invalid_attributes) {
    {quantity: 72}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BasketsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Basket.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      basket = Basket.create! valid_attributes
      get :show, params: {id: basket.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      basket = Basket.create! valid_attributes
      get :edit, params: {id: basket.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      # it "creates a new Basket" do
      #   expect {
      #     post :create, params: {basket: valid_attributes}, session: valid_session
      #   }.to change(Basket, :count).by(1)
      # end
      #
      # it "redirects to the created basket" do
      #   post :create, params: {basket: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Basket.last)
      # end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {basket: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {user_id: 1,
         product_id: 2,
         quantity: 10}
      }

      it "updates the requested basket" do
        basket = Basket.create! valid_attributes
        put :update, params: {id: basket.to_param, basket: new_attributes}, session: valid_session
        basket.reload
        expect(basket.quantity).to match(new_attributes[:quantity])
      end

      it "redirects to the basket" do
        basket = Basket.create! valid_attributes
        put :update, params: {id: basket.to_param, basket: valid_attributes}, session: valid_session
        expect(response).to redirect_to(basket)
      end
    end

    context "with invalid params" do
      # it "returns a success response (i.e. to display the 'edit' template)" do
      #   basket = Basket.create! valid_attributes
      #   put :update, params: {id: basket.to_param, basket: invalid_attributes}, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested basket" do
      basket = Basket.create! valid_attributes
      expect {
        delete :destroy, params: {id: basket.to_param}, session: valid_session
      }.to change(Basket, :count).by(-1)
    end

    it "redirects to the baskets list" do
      basket = Basket.create! valid_attributes
      delete :destroy, params: {id: basket.to_param}, session: valid_session
      expect(response).to redirect_to(baskets_url)
    end
  end

end
