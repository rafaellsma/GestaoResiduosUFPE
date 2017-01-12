class CreateSediments < ActiveRecord::Migration[5.0]
  def change
    create_table :sediments do |t|
      t.string :composition
      t.decimal :weight
      t.string :local
      t.date :data_created
      t.date :data_registered

      t.timestamps
    end
  end
end
