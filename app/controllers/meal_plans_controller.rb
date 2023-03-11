class MealPlansController < ApplicationController
  before_action :authenticate_account!

  layout -> { ApplicationLayout }

  def show
    active_meal_plan = current_account.active_meal_plan
    active_grocery_list = current_account.active_grocery_list

    return redirect_to new_meal_plans_path, status: :see_other unless active_meal_plan

    render MealPlans::ShowPageComponent.new(active_meal_plan: active_meal_plan, active_grocery_list: active_grocery_list)
  end

  def new
    recipes = Recipe.all
    render MealPlans::NewPageComponent.new(active_meal_plan: current_account.active_meal_plan, recipes: recipes)
  end

  def create
    if recipe_entries_params.blank?
      return render MealPlans::NewPageComponent.new(errors: ["You must select at least one recipe"], recipes: Recipe.all), status: :unprocessable_entity
    end

    household = current_account.household
    meal_plan = MealPlan.new(household: household)
    meal_plan.recipe_entries.build(recipe_entries_params)

    # TODO: combine with existing active list
    combined_ingredients_list = meal_plan.recipe_entries.flat_map { |re| re.scaled_ingredients_list }
    items_list = combined_ingredients_list.map { |ing| ing.values_at(:name, :quantity, :unit).join(", ") }
    grocery_list = GroceryList.new(household: household, items_list: items_list)

    MealPlan.transaction do
      meal_plan.save!
      grocery_list.save!
      household.update!(active_meal_plan: meal_plan, active_grocery_list: grocery_list)
    end

    redirect_to meal_plans_path(meal_plan), status: :see_other
  rescue ActiveRecord::RecordInvalid
    render MealPlans::NewPageComponent.new(errors: meal_plan.errors.full_messages, recipes: Recipe.all), status: :unprocessable_entity
  end

  def recipe_entries_params
    params
      .permit(recipe_entry: [:scale, :recipe_id])
      .require(:recipe_entry)
      .filter { |entry| entry[:recipe_id].present? }
  end
end
