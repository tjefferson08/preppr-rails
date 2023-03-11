# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  household_id    :integer
#
# Indexes
#
#  index_accounts_on_email         (email) UNIQUE
#  index_accounts_on_household_id  (household_id)
#
class Account < ApplicationRecord
  belongs_to :household

  has_secure_password

  delegate :active_meal_plan, :active_grocery_list, to: :household
end
