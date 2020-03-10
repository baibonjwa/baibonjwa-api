require 'test_helper'

class AppcheckControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    get app_check_url
    body = JSON.parse(response.body)
    assert_equal 'ok', body["status"]
    assert_response :success
  end
end
