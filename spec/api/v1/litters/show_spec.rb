require 'rails_helper'

RSpec.describe "litters#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/litters/#{litter.id}", params: params
  end

  describe 'basic fetch' do
    let!(:litter) { create(:litter) }

    it 'works' do
      expect(LitterResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('litters')
      expect(d.id).to eq(litter.id)
    end
  end
end
