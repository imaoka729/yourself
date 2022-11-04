require "test_helper"

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get menu_top_url
    assert_response :success
  end
end
