class AddSedimentsCollectToSediments < ActiveRecord::Migration[5.0]
  def change
    add_reference :sediments, :sediments_collect, foreign_key: true
  end
end
