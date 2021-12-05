require "rails_helper"

RSpec.describe "buyer_favorites#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/buyer_favorites/#{buyer_favorite.id}"
  end

  describe "basic destroy" do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    it "updates the resource" do
      expect(BuyerFavoriteResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BuyerFavorite.count }.by(-1)
      expect { buyer_favorite.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
