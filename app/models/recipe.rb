class Recipe < ApplicationRecord
  serialize :ingredients_list
  serialize :instructions_list
end

#------------------------------------------------------------------------------
# Recipe
#
# Name              SQL Type             Null    Primary Default
# ----------------- -------------------- ------- ------- ----------
# id                INTEGER              false   true              
# title             varchar              false   false             
# ingredients_list  TEXT                 false   false             
# instructions_list TEXT                 false   false             
# created_at        datetime(6)          false   false             
# updated_at        datetime(6)          false   false             
#
#------------------------------------------------------------------------------
