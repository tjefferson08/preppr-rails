require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "happy path" do
    account = accounts(:bob)

    visit sign_in_url

    fill_in "Email", with: account.email
    fill_in "Password", with: "password"

    click_button "Sign in"

    assert_text "Successfully signed in!"
  end
end
