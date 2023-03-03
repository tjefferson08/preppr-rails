class MealPlan < ApplicationRecord
  belongs_to :account
  has_many :recipe_entries, dependent: :destroy
end
