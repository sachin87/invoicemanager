require 'rails_helper'

RSpec.describe "Currencies", :type => :request do
  describe "GET /currencies" do
    it "works! (now write some real specs)" do
      get currencies_path
      expect(response.status).to be(200)
    end
  end
end
