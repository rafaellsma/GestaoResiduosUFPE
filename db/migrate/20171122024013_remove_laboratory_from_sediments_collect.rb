class RemoveLaboratoryFromSedimentsCollect < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sediments_collects, :laboratory, foreign_key: true
  end
end
