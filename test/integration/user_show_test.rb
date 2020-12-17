require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

  test "does not show post author when user is not signed in" do
    get root_path
    assert_template 'posts/index'
    assert_select "p.post-content"
    assert_select "p.post-author", count: 0
  end

  test "shows post author when user is signed in" do
    sign_in users(:madeline)
    get root_path
    assert_template 'posts/index'
    assert_select "p.post-content"
    assert_select "p.post-author"
  end
end
