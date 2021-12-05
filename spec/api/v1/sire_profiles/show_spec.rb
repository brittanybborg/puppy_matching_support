require 'rails_helper'

RSpec.describe "sire_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sire_profiles/#{sire_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:sire_profile) { create(:sire_profile) }

    it 'works' do
      expect(SireProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sire_profiles')
      expect(d.id).to eq(sire_profile.id)
    end
  end
end
