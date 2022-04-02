require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  test "should be able to bundle recipes into a meal plan" do
    beans = recipes(:beans_and_rice)

    visit new_meal_plan_url

    assert_selector "h1", text: "New meal plan"

    fill_in "recipe_search", with: "Beans"

    assert_unchecked_field beans.name

    check beans.name

    assert_difference "MealPlan.count", 1, "A new meal plan should be created" do
      click_on "Create Meal plan"
      assert_text "Meal plan was successfully created"
    end
  end
end
