class MealPlans::NewPageComponent < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::FieldsFor
  include Phlex::Rails::Helpers::Routes

  def initialize(active_meal_plan: nil, errors: [], recipes:)
    @active_meal_plan = active_meal_plan
    @errors = errors
    @recipes = recipes
  end

  def template
    h1 { "New Meal Plan" }

    if @errors.present?
      div { "Invalid meal plan: #{@errors.to_sentence}" }
    end

    p { "Find me in app/views/components/meal_plans/new_page_component_component.rb" }

    form_with(scope: :meal_plan, url: meal_plans_path) do |form|
      7.times do
        div do
          fields_for "recipe_entry[]", RecipeEntry.new do |fields|
            fields.label :scale do
              span { "Scale" }
              fields.select :scale, (1...5).map { |i| [i, i] }, include_blank: true
            end

            fields.label :recipe_id do
              span { "Recipe" }
              fields.collection_select :recipe_id,  @recipes, :id, :title, prompt: true
            end
          end
        end
      end

      submit(form)
    end
  end

  def submit(form)
    opts = if @active_meal_plan
             {data: {turbo_confirm: "This will replace your current active meal plan. OK?"}}
           else
             {}
           end
    form.submit "Save", **opts
  end
end
