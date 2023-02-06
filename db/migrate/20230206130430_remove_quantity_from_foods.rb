class RemoveQuantityFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :quantity
    remove_reference :foods, :user, null: false, index: true, foreign_key: true
  end
end
