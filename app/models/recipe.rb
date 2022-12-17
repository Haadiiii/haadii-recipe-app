class Recipe < ApplicationRecord
  has_many :recipes_foods, foreign_key: :recipe_id, dependent: :destroy
  belongs_to :user, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :cooking_time, presence: true, length: { maximum: 20 }
  validates :preparation_time, presence: true, length: { maximum: 20 }

  def recipe_count
    recipes_foods.count
  end
end
