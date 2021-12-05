require 'rails_helper'

RSpec.describe "litters#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/litters/#{litter.id}", payload
  end

  describe 'basic update' do
    let!(:litter) { create(:litter) }

    let(:payload) do
      {
        data: {
          id: litter.id.to_s,
          type: 'litters',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LitterResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { litter.reload.attributes }
    end
  end
end
