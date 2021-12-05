require 'rails_helper'

RSpec.describe "breeder_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/breeder_reviews/#{breeder_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:breeder_review) { create(:breeder_review) }

    it 'works' do
      expect(BreederReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('breeder_reviews')
      expect(d.id).to eq(breeder_review.id)
    end
  end
end
