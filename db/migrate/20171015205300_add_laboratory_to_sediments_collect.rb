class AddLaboratoryToSedimentsCollect < ActiveRecord::Migration[5.0]
  def change
    add_reference :sediments_collects, :laboratory, foreign_key: true
  end
end
