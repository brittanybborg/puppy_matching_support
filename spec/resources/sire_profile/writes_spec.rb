require "rails_helper"

RSpec.describe SireProfileResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "sire_profiles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SireProfileResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SireProfile.count }.by(1)
    end
  end

  describe "updating" do
    let!(:sire_profile) { create(:sire_profile) }

    let(:payload) do
      {
        data: {
          id: sire_profile.id.to_s,
          type: "sire_profiles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SireProfileResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { sire_profile.reload.updated_at }
      # .and change { sire_profile.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:sire_profile) { create(:sire_profile) }

    let(:instance) do
      SireProfileResource.find(id: sire_profile.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SireProfile.count }.by(-1)
    end
  end
end
