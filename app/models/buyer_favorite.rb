class BuyerFavorite < ApplicationRecord
  # Direct associations

  belongs_to :puppy,
             :class_name => "PuppyProfile",
             :counter_cache => true

  belongs_to :user,
             :class_name => "UserProfile",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
