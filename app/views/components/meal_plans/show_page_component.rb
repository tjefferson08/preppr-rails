# frozen_string_literal: true

class MealPlans::ShowPageComponent < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::LinkTo

  def initialize(active_meal_plan:)
    @active_meal_plan = active_meal_plan
  end

  def template
    h1 { "My Meal Plan"}
    link_to "New Meal Plan", new_meal_plans_path

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
  end
end
