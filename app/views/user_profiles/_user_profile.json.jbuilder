json.extract! user_profile, :id, :username, :breeder_true, :home_activity_level, :children_present, :cat_present, :home_location, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
json.token user.generate_jwt