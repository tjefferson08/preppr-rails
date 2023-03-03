require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  test "allow me to input my meal plan" do
    visit meal_plans_url

    assert_text "Sign in"

    account = accounts(:bob)
    fill_in "Email", with: account.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    assert_text "My Meal Plans"
  end
end
