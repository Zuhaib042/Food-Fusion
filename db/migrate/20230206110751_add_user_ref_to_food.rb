# frozen_string_literal: true

class AddUserRefToFood < ActiveRecord::Migration[7.0]
  def change
    # add_reference :foods, :user, null: false, index: true, foreign_key: true
    # add_column :foods, :user_id, :integer
  end
end
