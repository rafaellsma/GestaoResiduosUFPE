class AddEnrollmentToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :enrollment, :string
  end
end
