class RecipeEntry < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe

  attribute :scale, default: -> { 1 }
end
