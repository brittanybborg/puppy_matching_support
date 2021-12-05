class AddBuyerFavoriteCountToPuppyProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :puppy_profiles, :buyer_favorites_count, :integer
  end
end
