require "rails_helper"

RSpec.describe SupplerProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/suppler_products").to route_to("suppler_products#index")
    end

    it "routes to #show" do
      expect(:get => "/suppler_products/1").to route_to("suppler_products#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/suppler_products").to route_to("suppler_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/suppler_products/1").to route_to("suppler_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/suppler_products/1").to route_to("suppler_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/suppler_products/1").to route_to("suppler_products#destroy", :id => "1")
    end
  end
end
