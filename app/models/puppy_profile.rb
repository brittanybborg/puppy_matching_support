class PuppyProfile < ApplicationRecord
  enum activity_level: {"low"=>0, "medium"=>1, "high"=>2} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
