class AddDogProfileCountToLitters < ActiveRecord::Migration[6.0]
  def change
    add_column :litters, :dog_profiles_count, :integer
  end
end
