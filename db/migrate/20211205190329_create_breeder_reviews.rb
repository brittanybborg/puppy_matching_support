class CreateBreederReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :breeder_reviews do |t|
      t.string :description
      t.integer :buyer_id

      t.timestamps
    end
  end
end
