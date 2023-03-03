# frozen_string_literal: true

class MealPlans::ShowComponent < ApplicationComponent
  def template
    h1 { "MealPlans::Show" }
    p { "Find me in app/views/components/meal_plans/show_component.rb" }
  end
end
