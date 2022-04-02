class CreateMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plans do |t|
      t.string :state, null: false
      t.string :owner_id, null: false
      t.timestamps
    end

    create_table :meal_plans_recipes do |t|
      t.references :meal_plan, foreign_key: true
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
