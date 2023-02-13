require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/home"
      expect(response).to have_http_status(:success)
    end
  end

end
