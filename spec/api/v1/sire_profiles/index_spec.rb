require 'rails_helper'

RSpec.describe "sire_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sire_profiles", params: params
  end

  describe 'basic fetch' do
    let!(:sire_profile1) { create(:sire_profile) }
    let!(:sire_profile2) { create(:sire_profile) }

    it 'works' do
      expect(SireProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['sire_profiles'])
      expect(d.map(&:id)).to match_array([sire_profile1.id, sire_profile2.id])
    end
  end
end
