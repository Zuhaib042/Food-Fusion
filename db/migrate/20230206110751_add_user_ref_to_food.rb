class AddUserRefToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, null: false, index: true, foreign_key: true
  end
end
