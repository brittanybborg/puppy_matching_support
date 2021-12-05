class SireProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :photo, :string
  attribute :description, :string
  attribute :previous_litters, :integer
  attribute :age, :integer

  # Direct associations

  has_many   :litters,
             foreign_key: :sire_id

  # Indirect associations

end