class AddBitchReferenceToLitters < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :litters, :bitch_profiles, column: :bitch_id
    add_index :litters, :bitch_id
    change_column_null :litters, :bitch_id, false
  end
end
