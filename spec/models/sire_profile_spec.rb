require 'rails_helper'

RSpec.describe SireProfile, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:litters) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
