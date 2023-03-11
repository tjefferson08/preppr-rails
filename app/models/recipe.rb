# == Schema Information
#
# Table name: recipes
#
#  id                :integer          not null, primary key
#  ingredients_list  :text             not null
#  instructions_list :text             not null
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Recipe < ApplicationRecord
  serialize :ingredients_list
  serialize :instructions_list
end
