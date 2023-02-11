# frozen_string_literal: true

class AddFoodsRefToInventoryfoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :food, null: false, index: true, foreign_key: true
  end
end
