class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :center, foreign_key: true
      t.string :chief
      t.string :email
      t.string :phone_ext

      t.timestamps
    end
  end
end
