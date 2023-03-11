class AddGroceryLists < ActiveRecord::Migration[7.1]
  def change
    create_table :households do |t|
      t.string :name, null: false
      t.references :active_meal_plan, foreign_key: {to_table: :meal_plans}, null: true, index: true
      t.references :active_grocery_list, foreign_key: {to_table: :grocery_lists}, null: true, index: true
      t.timestamps
    end

    create_table :grocery_lists do |t|
      t.references :household, null: false, index: true
      t.text :items_list, null: false
      t.timestamps
    end

    add_reference :accounts, :household, index: true
    remove_reference :accounts, :active_meal_plan

    add_reference :meal_plans, :household, index: true
    remove_reference :meal_plans, :account
    remove_reference :meal_plans, :accounts
  end
end
