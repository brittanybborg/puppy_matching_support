class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :username
      t.boolean :breeder_true
      t.integer :home_activity_level
      t.boolean :children_present
      t.boolean :cat_present
      t.string :home_location

      t.timestamps
    end
  end
end
