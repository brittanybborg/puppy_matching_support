class CreateLitters < ActiveRecord::Migration[6.0]
  def change
    create_table :litters do |t|
      t.string :litter_name
      t.integer :sire_id
      t.integer :bitch_id
      t.integer :puppy_count
      t.datetime :due_date
      t.datetime :puppy_release_date

      t.timestamps
    end
  end
end
