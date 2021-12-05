class AddUserReferenceToBreederReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :breeder_reviews, :user_profiles, column: :buyer_id
    add_index :breeder_reviews, :buyer_id
    change_column_null :breeder_reviews, :buyer_id, false
  end
end
