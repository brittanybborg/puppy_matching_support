require 'rails_helper'

RSpec.describe "buyer_favorites#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/buyer_favorites/#{buyer_favorite.id}", payload
  end

  describe 'basic update' do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    let(:payload) do
      {
        data: {
          id: buyer_favorite.id.to_s,
          type: 'buyer_favorites',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BuyerFavoriteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { buyer_favorite.reload.attributes }
    end
  end
end
