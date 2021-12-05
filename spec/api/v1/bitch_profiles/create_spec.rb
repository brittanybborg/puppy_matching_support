require "rails_helper"

RSpec.describe "bitch_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/bitch_profiles", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "bitch_profiles",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(BitchProfileResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { BitchProfile.count }.by(1)
    end
  end
end
