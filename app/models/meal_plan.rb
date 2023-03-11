# == Schema Information
#
# Table name: meal_plans
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :integer
#
# Indexes
#
#  index_meal_plans_on_household_id  (household_id)
#
class MealPlan < ApplicationRecord
  belongs_to :household
  has_many :recipe_entries, dependent: :destroy
end
