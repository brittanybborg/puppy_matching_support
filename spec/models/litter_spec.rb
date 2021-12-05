require "rails_helper"

RSpec.describe Litter, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:bitch) }

    it { should belong_to(:sire) }

    it { should have_many(:dog_profiles) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:litter_name) }

    it { should validate_presence_of(:litter_name) }

    it { should validate_presence_of(:puppy_count) }
  end
end
