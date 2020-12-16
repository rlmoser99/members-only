require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_path
    assert_response :success
  end

  test "should redirect index to log in when not logged in" do
    get new_post_path
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
    assert_redirected_to new_user_session_path
  end
end
