class PuppyProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :litter_id, :integer
  attribute :alpha_true, :boolean
  attribute :runt_true, :boolean
  attribute :activity_level, :string_enum, allow: PuppyProfile.activity_levels.keys
  attribute :photo, :string
  attribute :description, :string

  # Direct associations

  belongs_to :litter

  has_many   :buyer_favorites,
             foreign_key: :puppy_id

  # Indirect associations

end
