# frozen_string_literal: true

class MealPlans::ShowPageComponent < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::LinkTo

  def initialize(active_meal_plan:, active_grocery_list: nil)
    @active_meal_plan = active_meal_plan
    @active_grocery_list = active_grocery_list
  end

  def template
    h1 { "My Meal Plan"}
    div { link_to "New Meal Plan", new_meal_plans_path }
    div { link_to "My Grocery List", grocery_lists_path }

    @active_meal_plan.recipe_entries.each do |recipe_entry|
      details do
        summary { recipe_entry.recipe.title }
        ul do
          recipe_entry.recipe.ingredients_list.each do |ing|
            li { ing }
          end
        end
      end
    end

    if @active_grocery_list
      ul do
        @active_grocery_list.items_list.each do |item|
          li { item }
        end
      end
    end
  end
end
