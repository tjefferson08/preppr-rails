class RecipeEntry < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe

  attribute :scale, default: -> { 1 }
end

#------------------------------------------------------------------------------
# RecipeEntry
#
# Name         SQL Type             Null    Primary Default
# ------------ -------------------- ------- ------- ----------
# id           INTEGER              false   true              
# recipe_id    INTEGER              false   false             
# meal_plan_id INTEGER              false   false             
# scale        INTEGER              false   false             
# created_at   datetime(6)          false   false             
# updated_at   datetime(6)          false   false             
#
#------------------------------------------------------------------------------
