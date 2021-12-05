require 'rails_helper'

RSpec.describe "bitch_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/bitch_profiles/#{bitch_profile.id}"
  end

  describe 'basic destroy' do
    let!(:bitch_profile) { create(:bitch_profile) }

    it 'updates the resource' do
      expect(BitchProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BitchProfile.count }.by(-1)
      expect { bitch_profile.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
