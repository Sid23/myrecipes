class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      # Association tables contains at least 2 foreign keys that are always integer
      # Of course it can also contain specific information regarding the relation, such as date, type,place... so and so on
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
