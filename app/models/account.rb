class Account < ApplicationRecord
  belongs_to :active_meal_plan, class_name: "MealPlan", foreign_key: :active_meal_plan_id, optional: true

  has_secure_password
end
