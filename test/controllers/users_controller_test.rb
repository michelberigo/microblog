require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    get users_url
    assert_response :success
  end

  test "get show" do
  	get user_url(users(:one))
  	assert_response :success
  end
end
