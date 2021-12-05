class BitchProfile < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :litters,
             foreign_key: "bitch_id"

  # Indirect associations

  has_many   :dog_profiles,
             through: :litters,
             source: :dog_profiles

  # Validations

  # Scopes

  def to_s
    name
  end
end
