require 'rails_helper'

RSpec.describe LitterResource, type: :resource do
  describe 'serialization' do
    let!(:litter) { create(:litter) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(litter.id)
      expect(data.jsonapi_type).to eq('litters')
    end
  end

  describe 'filtering' do
    let!(:litter1) { create(:litter) }
    let!(:litter2) { create(:litter) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: litter2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([litter2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:litter1) { create(:litter) }
      let!(:litter2) { create(:litter) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            litter1.id,
            litter2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            litter2.id,
            litter1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
