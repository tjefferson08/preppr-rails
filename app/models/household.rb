# == Schema Information
#
# Table name: households
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  active_grocery_list_id :integer
#  active_meal_plan_id    :integer
#
# Indexes
#
#  index_households_on_active_grocery_list_id  (active_grocery_list_id)
#  index_households_on_active_meal_plan_id     (active_meal_plan_id)
#
# Foreign Keys
#
#  active_grocery_list_id  (active_grocery_list_id => grocery_lists.id)
#  active_meal_plan_id     (active_meal_plan_id => meal_plans.id)
#
class Household < ApplicationRecord
  has_many :accounts
  belongs_to :active_meal_plan, class_name: "MealPlan", foreign_key: :active_meal_plan_id, optional: true
  belongs_to :active_grocery_list, class_name: "GroceryList", foreign_key: :active_grocery_list_id, optional: true
end
