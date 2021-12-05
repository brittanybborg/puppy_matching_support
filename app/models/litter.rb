class Litter < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :litter_name, :presence => true

  validates :puppy_count, :presence => true

  # Scopes

  def to_s
    litter_name
  end

end
