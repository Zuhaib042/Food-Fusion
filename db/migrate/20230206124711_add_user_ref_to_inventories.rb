class AddUserRefToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :user, null: false, index: true, foreign_key: true
  end
end
