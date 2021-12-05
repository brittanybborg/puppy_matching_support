class BreederReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :buyer_id, :integer

  # Direct associations

  belongs_to :user,
             resource: UserProfileResource,
             foreign_key: :buyer_id

  # Indirect associations

end
