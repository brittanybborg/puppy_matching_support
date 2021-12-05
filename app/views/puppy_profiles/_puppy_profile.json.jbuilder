json.extract! puppy_profile, :id, :name, :litter_id, :alpha_true, :runt_true, :activity_level, :photo, :description, :created_at, :updated_at
json.url puppy_profile_url(puppy_profile, format: :json)
