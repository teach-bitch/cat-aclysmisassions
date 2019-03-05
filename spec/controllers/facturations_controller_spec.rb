require 'rails_helper'

RSpec.describe FacturationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Facturation. As you add validations to Facturation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {basket_id: 2,
     price: 19.33}
  }

  let(:invalid_attributes) {
    {price: 25.25}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FacturationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Facturation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      facturation = Facturation.create! valid_attributes
      get :show, params: {id: facturation.to_param}, session: valid_session
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
      facturation = Facturation.create! valid_attributes
      get :edit, params: {id: facturation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      # it "creates a new Facturation" do
      #   expect {
      #     post :create, params: {facturation: valid_attributes}, session: valid_session
      #   }.to change(Facturation, :count).by(1)
      # end
      #
      # it "redirects to the created facturation" do
      #   post :create, params: {facturation: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Facturation.last)
      # end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {facturation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {basket_id: 2,
         price: 27}
      }

      it "updates the requested facturation" do
        facturation = Facturation.create! valid_attributes
        put :update, params: {id: facturation.to_param, facturation: new_attributes}, session: valid_session
        facturation.reload
        expect(facturation.price).to match(new_attributes[:price])
      end

      it "redirects to the facturation" do
        facturation = Facturation.create! valid_attributes
        put :update, params: {id: facturation.to_param, facturation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(facturation)
      end
    end

    context "with invalid params" do
      # it "returns a success response (i.e. to display the 'edit' template)" do
      #   facturation = Facturation.create! valid_attributes
      #   put :update, params: {id: facturation.to_param, facturation: invalid_attributes}, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested facturation" do
      facturation = Facturation.create! valid_attributes
      expect {
        delete :destroy, params: {id: facturation.to_param}, session: valid_session
      }.to change(Facturation, :count).by(-1)
    end

    it "redirects to the facturations list" do
      facturation = Facturation.create! valid_attributes
      delete :destroy, params: {id: facturation.to_param}, session: valid_session
      expect(response).to redirect_to(facturations_url)
    end
  end

end
