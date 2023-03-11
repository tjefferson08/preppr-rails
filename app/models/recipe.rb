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

  with_options presence: true do
    validates :title
    validates :ingredients_list
    validates :instructions_list
  end

  validate :validate_ingredients_list

  def validate_ingredients_list
    if !ingredients_list.is_a? Array
      errors.add(:ingredients_list, "must be array")
      return
    end

    _compliant_ings, noncompliant_ings = ingredients_list.partition do |ing|
      case ing
      in {text: String, quantity: Integer, unit: String, name: String} => h if h.values_at(:text, :unit, :name).all?(&:present?) && h[:quantity] > 0
        true
      else
        false
      end
    end

    if noncompliant_ings.present?
      errors.add(:ingredients_list, "each ingredient must have valid text, quantity, unit, and name attributes")
    end
  end
end
