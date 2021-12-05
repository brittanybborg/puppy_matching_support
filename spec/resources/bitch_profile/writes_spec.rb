require "rails_helper"

RSpec.describe BitchProfileResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "bitch_profiles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BitchProfileResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { BitchProfile.count }.by(1)
    end
  end

  describe "updating" do
    let!(:bitch_profile) { create(:bitch_profile) }

    let(:payload) do
      {
        data: {
          id: bitch_profile.id.to_s,
          type: "bitch_profiles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BitchProfileResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { bitch_profile.reload.updated_at }
      # .and change { bitch_profile.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:bitch_profile) { create(:bitch_profile) }

    let(:instance) do
      BitchProfileResource.find(id: bitch_profile.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { BitchProfile.count }.by(-1)
    end
  end
end
