require 'rails_helper'

RSpec.describe "breeder_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/breeder_reviews/#{breeder_review.id}", payload
  end

  describe 'basic update' do
    let!(:breeder_review) { create(:breeder_review) }

    let(:payload) do
      {
        data: {
          id: breeder_review.id.to_s,
          type: 'breeder_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BreederReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { breeder_review.reload.attributes }
    end
  end
end
