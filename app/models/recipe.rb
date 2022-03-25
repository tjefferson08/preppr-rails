class Recipe < ApplicationRecord
  serialize :ingredient_list, Array
  serialize :instructions, Array
end
