class AddDetailsToSediments < ActiveRecord::Migration[5.0]
  def change
    add_reference :sediments, :user, foreign_key: true
    add_reference :sediments, :laboratory, foreign_key: true
    add_column :sediments, :volume, :decimal
    add_column :sediments, :type, :string
  end
end
