require 'rails_helper'

RSpec.describe "breeder_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/breeder_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:breeder_review1) { create(:breeder_review) }
    let!(:breeder_review2) { create(:breeder_review) }

    it 'works' do
      expect(BreederReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['breeder_reviews'])
      expect(d.map(&:id)).to match_array([breeder_review1.id, breeder_review2.id])
    end
  end
end
