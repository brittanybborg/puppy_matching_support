require 'rails_helper'

RSpec.describe "litters#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/litters", params: params
  end

  describe 'basic fetch' do
    let!(:litter1) { create(:litter) }
    let!(:litter2) { create(:litter) }

    it 'works' do
      expect(LitterResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['litters'])
      expect(d.map(&:id)).to match_array([litter1.id, litter2.id])
    end
  end
end
