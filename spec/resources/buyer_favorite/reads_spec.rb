require "rails_helper"

RSpec.describe BuyerFavoriteResource, type: :resource do
  describe "serialization" do
    let!(:buyer_favorite) { create(:buyer_favorite) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(buyer_favorite.id)
      expect(data.jsonapi_type).to eq("buyer_favorites")
    end
  end

  describe "filtering" do
    let!(:buyer_favorite1) { create(:buyer_favorite) }
    let!(:buyer_favorite2) { create(:buyer_favorite) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: buyer_favorite2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([buyer_favorite2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:buyer_favorite1) { create(:buyer_favorite) }
      let!(:buyer_favorite2) { create(:buyer_favorite) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      buyer_favorite1.id,
                                      buyer_favorite2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      buyer_favorite2.id,
                                      buyer_favorite1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
