require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def test_fixture_is_valid
    r = recipes(:beans_and_rice)
    assert_predicate r, :valid?
  end

  def test_bad_ingredient_list_values_are_invalid
    r = recipes(:beans_and_rice)
    assert_not_empty r.ingredients_list

    test_cases = [
      ->(r) { r.ingredients_list = "" },
      ->(r) { r.ingredients_list[0][:text] = "" },
      ->(r) { r.ingredients_list[0][:text] = 100_000 },
      ->(r) { r.ingredients_list[0][:quantity] = 0 },
      ->(r) { r.ingredients_list[0][:quantity] = -1 },
      ->(r) { r.ingredients_list[0][:quantity] = "sup" },
      ->(r) { r.ingredients_list[0][:unit] = "" },
      ->(r) { r.ingredients_list[0][:unit] = :neat },
      ->(r) { r.ingredients_list[0][:name] = "" },
      ->(r) { r.ingredients_list[0][:name] = 100_000 },
    ]

    test_cases.each do |test_case|
      r.reload
      assert_predicate r, :valid?, "valid before test case"

      test_case.call(r)

      assert_predicate r, :invalid?, "invalid after test case"
    end
  end
end
