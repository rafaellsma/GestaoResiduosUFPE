class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_ext, :integer
    add_column :users, :admin, :boolean
    add_reference :users, :laboratory, foreign_key: true
  end
end
