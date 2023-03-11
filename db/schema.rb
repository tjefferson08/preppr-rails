# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_03_11_162105) do
  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "household_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["household_id"], name: "index_accounts_on_household_id"
  end

  create_table "grocery_lists", force: :cascade do |t|
    t.integer "household_id", null: false
    t.text "items_list", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_id"], name: "index_grocery_lists_on_household_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "name", null: false
    t.integer "active_meal_plan_id"
    t.integer "active_grocery_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_grocery_list_id"], name: "index_households_on_active_grocery_list_id"
    t.index ["active_meal_plan_id"], name: "index_households_on_active_meal_plan_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "household_id"
    t.index ["household_id"], name: "index_meal_plans_on_household_id"
  end

  create_table "recipe_entries", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "meal_plan_id", null: false
    t.integer "scale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_plan_id"], name: "index_recipe_entries_on_meal_plan_id"
    t.index ["recipe_id"], name: "index_recipe_entries_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.text "ingredients_list", null: false
    t.text "instructions_list", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "households", "grocery_lists", column: "active_grocery_list_id"
  add_foreign_key "households", "meal_plans", column: "active_meal_plan_id"
  add_foreign_key "recipe_entries", "meal_plans"
  add_foreign_key "recipe_entries", "recipes"
end
