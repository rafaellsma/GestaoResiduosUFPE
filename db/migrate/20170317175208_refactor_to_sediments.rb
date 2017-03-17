class RefactorToSediments < ActiveRecord::Migration[5.0]
  def change
    remove_column :sediments, :type
    add_column :sediments, :res_type, :string
  end
end
