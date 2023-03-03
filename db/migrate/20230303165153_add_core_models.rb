class AddCoreModels < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false, index: {unique: true}
      t.string :password_digest, null: false

      t.references :active_meal_plan, foreign_key: {to_table: :meal_plans}, null: true, index: true

      t.timestamps
    end

    create_table :meal_plans do |t|
      t.references :account, foreign_key: true, null: false, index: true

      t.timestamps
    end

    create_table :recipe_entries do |t|
      t.references :recipe, foreign_key: true, null: false, index: true
      t.references :meal_plan, foreign_key: true, null: false, index: true
      t.integer :scale, null: false
      t.timestamps
    end

    create_table :recipes do |t|
      t.string :title, null: false
      t.text :ingredients_list, null: false
      t.text :instructions_list, null: false
      t.timestamps
    end
  end
end
