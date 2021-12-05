json.extract! sire_profile, :id, :name, :photo, :description, :previous_litters, :age, :created_at, :updated_at
json.url sire_profile_url(sire_profile, format: :json)
