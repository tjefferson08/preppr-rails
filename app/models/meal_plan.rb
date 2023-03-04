class MealPlan < ApplicationRecord
  belongs_to :account
  has_many :recipe_entries, dependent: :destroy
end

#------------------------------------------------------------------------------
# MealPlan
#
# Name       SQL Type             Null    Primary Default
# ---------- -------------------- ------- ------- ----------
# id         INTEGER              false   true              
# account_id INTEGER              false   false             
# created_at datetime(6)          false   false             
# updated_at datetime(6)          false   false             
#
#------------------------------------------------------------------------------
