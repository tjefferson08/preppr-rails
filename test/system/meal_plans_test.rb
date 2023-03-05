require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  test "allow me to input my meal plan" do
    visit meal_plans_url

    assert_text "Sign in"

    account = accounts(:bob)
    fill_in "Email", with: account.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    assert_text "My Meal Plan"
    assert_no_text "Macaroni and Cheese"

    click_link "New Meal Plan"
    recipe_selects = find_all(:select, "Recipe")

    recipe_selects[0].select "Beans and Rice"
    recipe_selects[1].select "Macaroni and Cheese"

    accept_confirm { click_button "Save" }

    assert_text "Beans and Rice"
    assert_text "Macaroni and Cheese"
  end
end
