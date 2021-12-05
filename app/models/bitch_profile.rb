class BitchProfile < ApplicationRecord
  # Direct associations

  has_many   :litters,
             :foreign_key => "bitch_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
