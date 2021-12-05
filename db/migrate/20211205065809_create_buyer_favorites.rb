class CreateBuyerFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_favorites do |t|
      t.integer :user_id
      t.integer :puppy_id

      t.timestamps
    end
  end
end
