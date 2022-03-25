require "test_helper"

class ImportControllerTest < ActionDispatch::IntegrationTest
  test "import should kick off import operation" do
    import_mock = Minitest::Mock.new
    import_mock.expect(:to_h, {fake: "recipe"}, [])

    ImportedRecipe.stub :new, import_mock do
      post import_path, params: {url: "http://hello.com/beans"}, as: :json
    end

    assert_mock import_mock
  end
end
