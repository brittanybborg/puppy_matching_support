class SireProfile < ApplicationRecord
  # Direct associations

  has_many   :litters,
             :foreign_key => "sire_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
