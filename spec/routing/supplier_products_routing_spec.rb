require "rails_helper"

RSpec.describe SupplierProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/supplier_products").to route_to("supplier_products#index")
    end

    it "routes to #show" do
      expect(:get => "/supplier_products/1").to route_to("supplier_products#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/supplier_products").to route_to("supplier_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/supplier_products/1").to route_to("supplier_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/supplier_products/1").to route_to("supplier_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/supplier_products/1").to route_to("supplier_products#destroy", :id => "1")
    end
  end
end
