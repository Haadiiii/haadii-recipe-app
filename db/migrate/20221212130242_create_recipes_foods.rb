class CreateRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_foods do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
