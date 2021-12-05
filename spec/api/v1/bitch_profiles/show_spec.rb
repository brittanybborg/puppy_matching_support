require "rails_helper"

RSpec.describe "bitch_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bitch_profiles/#{bitch_profile.id}", params: params
  end

  describe "basic fetch" do
    let!(:bitch_profile) { create(:bitch_profile) }

    it "works" do
      expect(BitchProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("bitch_profiles")
      expect(d.id).to eq(bitch_profile.id)
    end
  end
end
