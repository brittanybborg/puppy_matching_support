require 'rails_helper'

RSpec.describe BuyerFavoriteResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'buyer_favorites',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BuyerFavoriteResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BuyerFavorite.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    let(:payload) do
      {
        data: {
          id: buyer_favorite.id.to_s,
          type: 'buyer_favorites',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BuyerFavoriteResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { buyer_favorite.reload.updated_at }
      # .and change { buyer_favorite.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    let(:instance) do
      BuyerFavoriteResource.find(id: buyer_favorite.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BuyerFavorite.count }.by(-1)
    end
  end
end
