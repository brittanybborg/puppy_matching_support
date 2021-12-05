class AddUserReferenceToBuyerFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :buyer_favorites, :user_profiles, column: :user_id
    add_index :buyer_favorites, :user_id
    change_column_null :buyer_favorites, :user_id, false
  end
end
