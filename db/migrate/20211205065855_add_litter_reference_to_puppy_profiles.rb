class AddLitterReferenceToPuppyProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :puppy_profiles, :litters
    add_index :puppy_profiles, :litter_id
    change_column_null :puppy_profiles, :litter_id, false
  end
end
