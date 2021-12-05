class Litter < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :puppy_count, :presence => true

  # Scopes

  def to_s
    litter_name
  end

end
