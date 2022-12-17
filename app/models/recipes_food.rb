class RecipesFood < ApplicationRecord
  belongs_to :recipe, foreign_key: :recipe_id
  belongs_to :food, foreign_key: :food_id

  validates :quantity, presence: true, length: { maximum: 20 }
end
