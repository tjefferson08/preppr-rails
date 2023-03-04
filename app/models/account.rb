class Account < ApplicationRecord
  belongs_to :active_meal_plan, class_name: "MealPlan", foreign_key: :active_meal_plan_id, optional: true

  has_secure_password
end

#------------------------------------------------------------------------------
# Account
#
# Name                SQL Type             Null    Primary Default
# ------------------- -------------------- ------- ------- ----------
# id                  INTEGER              false   true              
# name                varchar              false   false             
# email               varchar              false   false             
# password_digest     varchar              false   false             
# active_meal_plan_id INTEGER              true    false             
# created_at          datetime(6)          false   false             
# updated_at          datetime(6)          false   false             
#
#------------------------------------------------------------------------------
