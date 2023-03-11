# == Schema Information
#
# Table name: recipe_entries
#
#  id           :integer          not null, primary key
#  scale        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meal_plan_id :integer          not null
#  recipe_id    :integer          not null
#
# Indexes
#
#  index_recipe_entries_on_meal_plan_id  (meal_plan_id)
#  index_recipe_entries_on_recipe_id     (recipe_id)
#
# Foreign Keys
#
#  meal_plan_id  (meal_plan_id => meal_plans.id)
#  recipe_id     (recipe_id => recipes.id)
#
class RecipeEntry < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe

  attribute :scale, default: -> { 1 }
end
