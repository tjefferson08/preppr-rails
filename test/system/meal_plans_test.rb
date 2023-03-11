require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  test "allow me to input my meal plan" do
    account = accounts(:bob)
    assert_not_nil account.active_meal_plan

    visit meal_plans_url

    assert_text "Sign in"

    fill_in "Email", with: account.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    assert_text "My Meal Plan"
    assert_no_text "Macaroni and Cheese"

    click_link "New Meal Plan"
    recipe_selects = find_all(:select, "Recipe")
    scale_selects = find_all(:select, "Scale")

    recipe_selects[0].select "Beans and Rice"
    scale_selects[0].select "1"

    recipe_selects[1].select "Macaroni and Cheese"
    scale_selects[1].select "3"

    assert_changes -> { MealPlan.count }, 1 do
      assert_changes -> { GroceryList.count }, 1 do
        accept_confirm { click_button "Save" }
      end
    end

    assert_text "Beans and Rice"
    assert_text "Macaroni and Cheese"

    assert_text "black beans, 1, cup"
    assert_text "macaroni and cheese, 3, box"
  end
end
