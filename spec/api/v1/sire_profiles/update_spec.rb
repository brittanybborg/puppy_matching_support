require "rails_helper"

RSpec.describe "sire_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sire_profiles/#{sire_profile.id}", payload
  end

  describe "basic update" do
    let!(:sire_profile) { create(:sire_profile) }

    let(:payload) do
      {
        data: {
          id: sire_profile.id.to_s,
          type: "sire_profiles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SireProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { sire_profile.reload.attributes }
    end
  end
end
