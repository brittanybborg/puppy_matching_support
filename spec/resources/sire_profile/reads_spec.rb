require "rails_helper"

RSpec.describe SireProfileResource, type: :resource do
  describe "serialization" do
    let!(:sire_profile) { create(:sire_profile) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sire_profile.id)
      expect(data.jsonapi_type).to eq("sire_profiles")
    end
  end

  describe "filtering" do
    let!(:sire_profile1) { create(:sire_profile) }
    let!(:sire_profile2) { create(:sire_profile) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: sire_profile2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([sire_profile2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:sire_profile1) { create(:sire_profile) }
      let!(:sire_profile2) { create(:sire_profile) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sire_profile1.id,
                                      sire_profile2.id,
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
                                      sire_profile2.id,
                                      sire_profile1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
