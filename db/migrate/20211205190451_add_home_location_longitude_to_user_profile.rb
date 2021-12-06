class AddHomeLocationLongitudeToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :home_location_longitude, :float
  end
end
