class AddDetailsToLaboratory < ActiveRecord::Migration[5.0]
  def change
    add_reference :laboratories, :department, foreign_key: true
  end
end
