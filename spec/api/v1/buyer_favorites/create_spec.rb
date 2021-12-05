require "rails_helper"

RSpec.describe "buyer_favorites#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/buyer_favorites", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "buyer_favorites",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(BuyerFavoriteResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { BuyerFavorite.count }.by(1)
    end
  end
end
