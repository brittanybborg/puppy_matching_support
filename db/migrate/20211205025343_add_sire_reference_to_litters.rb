class AddSireReferenceToLitters < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :litters, :sire_profiles, column: :sire_id
    add_index :litters, :sire_id
    change_column_null :litters, :sire_id, false
  end
end
