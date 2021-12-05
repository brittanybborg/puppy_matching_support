class UserProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :breeder_true, :boolean
  attribute :home_activity_level, :string_enum, allow: UserProfile.home_activity_levels.keys
  attribute :children_present, :boolean
  attribute :cat_present, :boolean
  attribute :home_location, :string

  # Direct associations

  # Indirect associations

end