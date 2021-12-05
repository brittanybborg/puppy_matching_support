class BitchProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :photo, :string
  attribute :description, :string
  attribute :previous_litters, :integer
  attribute :age, :integer

  # Direct associations

  has_many   :litters,
             foreign_key: :bitch_id

  # Indirect associations

  has_many :dog_profiles, resource: PuppyProfileResource do
    assign_each do |bitch_profile, puppy_profiles|
      puppy_profiles.select do |p|
        p.id.in?(bitch_profile.dog_profiles.map(&:id))
      end
    end
  end

end
