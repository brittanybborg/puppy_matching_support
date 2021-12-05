class CreateBitchProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :bitch_profiles do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :previous_litters
      t.integer :age

      t.timestamps
    end
  end
end
