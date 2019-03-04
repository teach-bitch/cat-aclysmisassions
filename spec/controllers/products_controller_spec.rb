require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {category_id: 1,
     title: "Charette",
     description: "Pour faire les courses comme au moyen-âge.",
     price: 90.50,
     quantity: 25,
     reference: "PIMP-MY-SPEC-84FF555"}
  }

  let(:invalid_attributes) {
    {reference: "NOT-PIMPING-ITS-INVALID"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Product.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}, session: valid_session
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
      product = Product.create! valid_attributes
      get :edit, params: {id: product.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      # it "creates a new Product" do
      #   expect {
      #     post :create, params: {product: valid_attributes}, session: valid_session
      #   }.to change(Product, :count).by(1)
      # end
      #
      # it "redirects to the created product" do
      #   post :create, params: {product: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Product.last)
      # end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {category_id: 1,
         title: "Charette",
         description: "Pour faire les courses comme au moyen-âge.",
         price: 75.0,
         quantity: 25,
         reference: "PIMP-MY-SPEC-84FF555"}
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session
        product.reload
        expect(product.price).to match(new_attributes[:price])
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      # it "returns a success response (i.e. to display the 'edit' template)" do
      #   product = Product.create! valid_attributes
      #   put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}, session: valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, params: {id: product.to_param}, session: valid_session
      expect(response).to redirect_to(products_url)
    end
  end

end
