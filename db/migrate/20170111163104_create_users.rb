class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_ext
      t.string :email
      t.string :password
      t.boolean :admin
      t.references :laboratory, foreign_key: true

      t.timestamps
    end
  end
end
