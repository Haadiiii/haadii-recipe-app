class RenamePublicInRecipe < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :public, :public_recipe
  end
end
