class InventoryFood < ApplicationRecord
  belongs_to :inventory, foreign_key: :inventory_id
  belongs_to :food, foreign_key: :food_id

  validates :quantity, presence: true, length: { maximum: 50 }
end
