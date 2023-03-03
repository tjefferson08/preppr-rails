require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit meal_plans_url

    assert_selector "h1", text: "MealPlans"
  end
end
