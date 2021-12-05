class LitterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :litter_name, :string
  attribute :sire_id, :integer
  attribute :bitch_id, :integer
  attribute :puppy_count, :integer
  attribute :due_date, :datetime
  attribute :puppy_release_date, :datetime

  # Direct associations

  belongs_to :sire,
             resource: SireProfileResource

  has_many   :dog_profiles,
             resource: PuppyProfileResource

  # Indirect associations

end
