class CreatePuppyProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :puppy_profiles do |t|
      t.string :name
      t.integer :litter_id
      t.boolean :alpha_true
      t.boolean :runt_true
      t.integer :activity_level
      t.string :photo
      t.string :description

      t.timestamps
    end
  end
end
