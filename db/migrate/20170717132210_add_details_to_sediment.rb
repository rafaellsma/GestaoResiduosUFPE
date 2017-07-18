class AddDetailsToSediment < ActiveRecord::Migration[5.0]
  def change
    add_column :sediments, :recipient_type, :string
    add_column :sediments, :stock_location, :string
  end
end
