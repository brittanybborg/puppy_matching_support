class Litter < ApplicationRecord
  # Direct associations

  has_many   :dog_profiles,
             :class_name => "PuppyProfile",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :litter_name, :uniqueness => true

  validates :litter_name, :presence => true

  validates :puppy_count, :presence => true

  # Scopes

  def to_s
    litter_name
  end

end
