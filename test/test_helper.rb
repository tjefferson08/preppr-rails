ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

require "capybara/cuprite"
Capybara.javascript_driver = :my_cuprite
Capybara.register_driver(:my_cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, window_size: [1200, 800], inspector: true)
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
