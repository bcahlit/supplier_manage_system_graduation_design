require 'rails_helper'

RSpec.describe "SupplerProducts", type: :request do
  describe "GET /suppler_products" do
    it "works! (now write some real specs)" do
      get suppler_products_path
      expect(response).to have_http_status(200)
    end
  end
end
