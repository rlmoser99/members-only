require 'test_helper'
require 'pry'

class SiteLayoutTest < ActionDispatch::IntegrationTest

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
  
  test "layout links " do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "p.post-author", count: 0
    user = users(:madeline)
    sign_in_as(user)
    # assert_template 'posts/index'
    # assert_redirected_to root_path
    # follow_redirect!
    # get root_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path, count: 0
    # assert_select "a[href=?]", new_post_path
    # assert_select "a[href=?]", destroy_user_session_path
  end
end
