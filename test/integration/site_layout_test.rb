require 'test_helper'
require 'pry'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links when user is not signed in" do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_post_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path, count: 0
  end
  
  # test "layout links when user is signed in" do
  #   sign_in users(:madeline)
  #   get root_path
  #   assert_template 'posts/index'
  #   assert_select "a[href=?]", root_path
  #   assert_select "a[href=?]", new_user_session_path, count: 0
  #   assert_select "a[href=?]", new_user_registration_path, count: 0
  #   assert_select "a[href=?]", new_post_path
  #   assert_select "a[href=?]", destroy_user_session_path
  # end
end
