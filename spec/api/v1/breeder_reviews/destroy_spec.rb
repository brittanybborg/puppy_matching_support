require "rails_helper"

RSpec.describe "breeder_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/breeder_reviews/#{breeder_review.id}"
  end

  describe "basic destroy" do
    let!(:breeder_review) { create(:breeder_review) }

    it "updates the resource" do
      expect(BreederReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BreederReview.count }.by(-1)
      expect { breeder_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
