class CreateLaboratoriesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :laboratories_users do |t|
      t.references :user, foreign_key: true
      t.references :laboratory, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
