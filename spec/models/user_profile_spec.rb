require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:cat_present) }

    it { should validate_presence_of(:children_present) }

    it { should validate_presence_of(:home_activity_level) }

    it { should validate_uniqueness_of(:home_location) }

    it { should validate_presence_of(:home_location) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
