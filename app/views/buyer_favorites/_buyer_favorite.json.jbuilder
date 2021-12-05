json.extract! buyer_favorite, :id, :user_id, :puppy_id, :created_at, :updated_at
json.url buyer_favorite_url(buyer_favorite, format: :json)
