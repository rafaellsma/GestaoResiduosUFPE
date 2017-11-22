class RemoveLaboratoryFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :laboratory, foreign_key: true
  end
end
