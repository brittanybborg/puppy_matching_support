class AddLitterCountToBitchProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :bitch_profiles, :litters_count, :integer
  end
end
