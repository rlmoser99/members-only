require 'test_helper'
require 'pry'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "can get post index" do
    get root_path
    assert_response :success
  end

  test "layout links when user is not signed in" do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
  end

  test "no post author listed when user is not signed in" do
    get root_path
    assert_template 'posts/index'
    assert_select "p.post-author", count: 0
  end
  
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

  test "layout links " do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    # assert_select "p.post-content"
    assert_select "p.post-author", count: 0
    # user = users(:madeline)
    # sign_in_as(user)
    sign_in users(:madeline)
    # assert_template 'posts/index'
    # assert_redirected_to root_path
    # follow_redirect!
    # get root_path 
    # assert_select "a[href=?]", root_path
    # assert_select "a[href=?]", new_user_session_path, count: 0
    # assert_select "a[href=?]", new_post_path
    # assert_select "a[href=?]", destroy_user_session_path
  end
end
