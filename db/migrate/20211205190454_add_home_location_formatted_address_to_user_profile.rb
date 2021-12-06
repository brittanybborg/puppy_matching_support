class AddHomeLocationFormattedAddressToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :home_location_formatted_address, :string
  end
end
