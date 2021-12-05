class AddLitterCountToSireProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :sire_profiles, :litters_count, :integer
  end
end
