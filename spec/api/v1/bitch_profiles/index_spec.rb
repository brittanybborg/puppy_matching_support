require "rails_helper"

RSpec.describe "bitch_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bitch_profiles", params: params
  end

  describe "basic fetch" do
    let!(:bitch_profile1) { create(:bitch_profile) }
    let!(:bitch_profile2) { create(:bitch_profile) }

    it "works" do
      expect(BitchProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["bitch_profiles"])
      expect(d.map(&:id)).to match_array([bitch_profile1.id, bitch_profile2.id])
    end
  end
end
