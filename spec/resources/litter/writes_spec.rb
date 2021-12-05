require 'rails_helper'

RSpec.describe LitterResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'litters',
          attributes: { }
        }
      }
    end

    let(:instance) do
      LitterResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Litter.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:litter) { create(:litter) }

    let(:payload) do
      {
        data: {
          id: litter.id.to_s,
          type: 'litters',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      LitterResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { litter.reload.updated_at }
      # .and change { litter.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:litter) { create(:litter) }

    let(:instance) do
      LitterResource.find(id: litter.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Litter.count }.by(-1)
    end
  end
end
