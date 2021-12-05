class AddPuppyReferenceToBuyerFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :buyer_favorites, :puppy_profiles, column: :puppy_id
    add_index :buyer_favorites, :puppy_id
    change_column_null :buyer_favorites, :puppy_id, false
  end
end
