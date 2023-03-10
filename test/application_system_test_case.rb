require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :my_cuprite, screen_size: [1400, 1400]
end
