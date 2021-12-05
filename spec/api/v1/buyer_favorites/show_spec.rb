require 'rails_helper'

RSpec.describe "buyer_favorites#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/buyer_favorites/#{buyer_favorite.id}", params: params
  end

  describe 'basic fetch' do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    it 'works' do
      expect(BuyerFavoriteResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('buyer_favorites')
      expect(d.id).to eq(buyer_favorite.id)
    end
  end
end
