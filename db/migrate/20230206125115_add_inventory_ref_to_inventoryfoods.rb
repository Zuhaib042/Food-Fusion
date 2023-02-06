class AddInventoryRefToInventoryfoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :inventory, null: false, index: true, foreign_key: true
  end
end
