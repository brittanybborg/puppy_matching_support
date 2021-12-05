require "rails_helper"

RSpec.describe "litters#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/litters/#{litter.id}"
  end

  describe "basic destroy" do
    let!(:litter) { create(:litter) }

    it "updates the resource" do
      expect(LitterResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Litter.count }.by(-1)
      expect { litter.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
