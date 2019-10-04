require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_item" do
    it "returns http success" do
      get :add_item
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_item" do
    it "returns http success" do
      get :update_item
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete_item" do
    it "returns http success" do
      get :delete_item
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #setup_cart_item" do
    it "returns http success" do
      get :setup_cart_item
      expect(response).to have_http_status(:success)
    end
  end

end
