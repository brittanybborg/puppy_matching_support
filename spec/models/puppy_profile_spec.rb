require "rails_helper"

RSpec.describe PuppyProfile, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:litter) }

    it { should have_many(:buyer_favorites) }
  end

  describe "InDirect Associations" do
    it { should have_one(:sire) }

    it { should have_one(:bitch) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }
  end
end
