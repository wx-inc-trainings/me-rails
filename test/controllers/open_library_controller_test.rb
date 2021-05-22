require "test_helper"

class OpenLibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get open_library_index_url
    assert_response :success
  end
end
