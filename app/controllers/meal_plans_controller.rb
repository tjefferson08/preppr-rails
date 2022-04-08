class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[show edit update destroy]

  # GET /meal_plans
  def index
    @meal_plans = MealPlan.all
  end

  # GET /meal_plans/1
  def show
  end

  # GET /meal_plans/new
  def new
    @meal_plan = MealPlan.new
    @recipes = Recipe.where("lower(name) LIKE ?", "%#{params[:recipe_search].to_s.downcase}%")
  end

  # GET /meal_plans/1/edit
  def edit
    @recipes = Recipe.where("lower(name) LIKE ?", "%#{params[:recipe_search].to_s.downcase}%")
      .reject { |r| @meal_plan.recipes.include? r }
  end

  # POST /meal_plans
  def create
    @meal_plan = MealPlan.new(meal_plan_params.merge(state: "draft", owner_id: current_account.key))
    @meal_plan.recipe_ids += [params[:add_recipe_id].to_i] if params[:add_recipe_id].present?
    @meal_plan.recipe_ids -= [params[:remove_recipe_id].to_i] if params[:remove_recipe_id].present?

    if @meal_plan.save
      redirect_to edit_meal_plan_path(@meal_plan), notice: "Meal plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meal_plans/1
  def update
    @meal_plan.recipe_ids += [params[:add_recipe_id].to_i] if params[:add_recipe_id].present?
    @meal_plan.recipe_ids -= [params[:remove_recipe_id].to_i] if params[:remove_recipe_id].present?

    if @meal_plan.update(meal_plan_params)
      redirect_to edit_meal_plan_path(@meal_plan), notice: "Meal plan was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /meal_plans/1
  def destroy
    @meal_plan.destroy
    redirect_to meal_plans_url, notice: "Meal plan was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_plan_params
    params.fetch(:meal_plan, {}).permit(recipe_ids: [])
  end
end
