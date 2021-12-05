class BreederReview < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "UserProfile",
             :foreign_key => "buyer_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end

end
