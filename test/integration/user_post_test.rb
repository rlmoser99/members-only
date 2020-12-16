require 'test_helper'

class UserPostTest < ActionDispatch::IntegrationTest
  test "user can make new post when signed in" do
    get root_path
    sign_in users(:madeline)
    get new_post_path
    assert_response :success
  end

  test "user can not make new post when not signed in" do
    get root_path
    get new_post_path
    assert_response :redirect 
  end
end
