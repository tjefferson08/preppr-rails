class Recipe < ApplicationRecord
  serialize :ingredients_list
  serialize :instructions_list
end
