require 'rails_helper'

RSpec.describe BreederReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'breeder_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BreederReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BreederReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:breeder_review) { create(:breeder_review) }

    let(:payload) do
      {
        data: {
          id: breeder_review.id.to_s,
          type: 'breeder_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BreederReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { breeder_review.reload.updated_at }
      # .and change { breeder_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:breeder_review) { create(:breeder_review) }

    let(:instance) do
      BreederReviewResource.find(id: breeder_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BreederReview.count }.by(-1)
    end
  end
end
