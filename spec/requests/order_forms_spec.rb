require 'rails_helper'

RSpec.describe "OrderForms", type: :request do
  describe "GET /order_forms" do
    it "works! (now write some real specs)" do
      get order_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
