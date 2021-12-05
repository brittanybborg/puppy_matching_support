require 'rails_helper'

RSpec.describe "buyer_favorites#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/buyer_favorites", params: params
  end

  describe 'basic fetch' do
    let!(:buyer_favorite1) { create(:buyer_favorite) }
    let!(:buyer_favorite2) { create(:buyer_favorite) }

    it 'works' do
      expect(BuyerFavoriteResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['buyer_favorites'])
      expect(d.map(&:id)).to match_array([buyer_favorite1.id, buyer_favorite2.id])
    end
  end
end
