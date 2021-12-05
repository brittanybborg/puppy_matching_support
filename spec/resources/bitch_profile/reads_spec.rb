require "rails_helper"

RSpec.describe BitchProfileResource, type: :resource do
  describe "serialization" do
    let!(:bitch_profile) { create(:bitch_profile) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(bitch_profile.id)
      expect(data.jsonapi_type).to eq("bitch_profiles")
    end
  end

  describe "filtering" do
    let!(:bitch_profile1) { create(:bitch_profile) }
    let!(:bitch_profile2) { create(:bitch_profile) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: bitch_profile2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([bitch_profile2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:bitch_profile1) { create(:bitch_profile) }
      let!(:bitch_profile2) { create(:bitch_profile) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      bitch_profile1.id,
                                      bitch_profile2.id,
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
                                      bitch_profile2.id,
                                      bitch_profile1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
