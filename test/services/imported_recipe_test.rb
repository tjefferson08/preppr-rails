require "test_helper"

class ImportedRecipeTest < ActiveSupport::TestCase
  test "should import a recipe from the internet" do
    import = ImportedRecipe.new("https://www.mealime.com/recipes/better-than-takeout-chicken-fried-rice-gf/1071")

    data = import.to_h

    assert_equal "Better Than Takeout Chicken Fried Rice", data[:name]
    assert data.values.all?(&:present?), "all values in data payload are present"
  end
end
