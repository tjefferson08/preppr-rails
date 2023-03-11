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
require 'test_helper'

class RecipeEntryTest < ActiveSupport::TestCase
  def test_ingredients_list_is_scaled
    r = recipes(:mac_n_cheese)
    re = RecipeEntry.new(scale: 3, recipe: r)

    actual_ingredients = re.scaled_ingredients_list

    assert_equal [3, "box", "macaroni and cheese"], actual_ingredients[0].values_at(:quantity, :unit, :name)
    assert_equal [0.75, "cup", "milk"], actual_ingredients[1].values_at(:quantity, :unit, :name)
  end
end
