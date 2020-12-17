require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  
  test "login with invalid information" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { session: { email: "", password: "" } }
    assert_template 'devise/sessions/new'
    assert_equal "Invalid Email or password.", flash[:alert]
  end
  
  test "login with valid information" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    sign_in users(:madeline)
    # Passes test, but does not do what I think it should.
    post user_session_url
    assert_redirected_to root_path
    follow_redirect!
    # assert_equal "Signed in successfully.", flash[:notice]
    assert_response :success
    assert_template 'posts/index'
  end
end
