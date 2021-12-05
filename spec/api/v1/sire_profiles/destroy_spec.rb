require 'rails_helper'

RSpec.describe "sire_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sire_profiles/#{sire_profile.id}"
  end

  describe 'basic destroy' do
    let!(:sire_profile) { create(:sire_profile) }

    it 'updates the resource' do
      expect(SireProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SireProfile.count }.by(-1)
      expect { sire_profile.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
