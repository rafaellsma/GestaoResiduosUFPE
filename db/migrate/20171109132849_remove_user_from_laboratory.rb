class RemoveUserFromLaboratory < ActiveRecord::Migration[5.0]
  def change
    remove_reference :laboratories, :user, foreign_key: true
  end
end
