class AddDepartmentFromSedimentsCollect < ActiveRecord::Migration[5.0]
  def change
    add_reference :sediments_collects, :department, foreign_key: true
  end
end
