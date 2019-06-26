require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "get show" do
    get user_post_url(@post, @post.id)
    assert_response :success
  end
end
