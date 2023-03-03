class MealPlansController < ApplicationController
  before_action :authenticate_account!

  layout -> { ApplicationLayout }

  def show
    render MealPlans::ShowPageComponent.new
  end
end
