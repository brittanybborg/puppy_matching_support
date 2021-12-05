json.extract! breeder_review, :id, :description, :buyer_id, :created_at,
              :updated_at
json.url breeder_review_url(breeder_review, format: :json)
