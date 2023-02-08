# frozen_string_literal: true

class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food
end
