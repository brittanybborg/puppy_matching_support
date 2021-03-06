class BuyerFavoriteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :puppy_id, :integer

  # Direct associations

  belongs_to :puppy,
             resource: PuppyProfileResource

  belongs_to :user,
             resource: UserProfileResource

  # Indirect associations
end
