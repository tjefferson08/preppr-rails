class MealPlansController < ApplicationController
  def show
    render MealPlans::ShowPageComponent.new
  end
end
