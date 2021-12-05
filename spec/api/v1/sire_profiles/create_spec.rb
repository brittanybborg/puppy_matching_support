require 'rails_helper'

RSpec.describe "sire_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/sire_profiles", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'sire_profiles',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SireProfileResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SireProfile.count }.by(1)
    end
  end
end
