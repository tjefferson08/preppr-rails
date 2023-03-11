# == Schema Information
#
# Table name: grocery_lists
#
#  id           :integer          not null, primary key
#  items_list   :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :integer          not null
#
# Indexes
#
#  index_grocery_lists_on_household_id  (household_id)
#
class GroceryList < ApplicationRecord
  belongs_to :household

  serialize :items_list
end
