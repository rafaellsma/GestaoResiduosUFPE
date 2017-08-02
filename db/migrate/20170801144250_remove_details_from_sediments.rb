class RemoveDetailsFromSediments < ActiveRecord::Migration[5.0]
  def change
    remove_column :sediments, :local
    remove_column :sediments, :data_created
    remove_column :sediments, :created_at
    remove_column :sediments, :updated_at
  end
end
