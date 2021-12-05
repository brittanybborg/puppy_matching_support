require "rails_helper"

RSpec.describe "bitch_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/bitch_profiles/#{bitch_profile.id}", payload
  end

  describe "basic update" do
    let!(:bitch_profile) { create(:bitch_profile) }

    let(:payload) do
      {
        data: {
          id: bitch_profile.id.to_s,
          type: "bitch_profiles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BitchProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { bitch_profile.reload.attributes }
    end
  end
end
