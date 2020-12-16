require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

  test "no post author listed when user is not signed in" do
    get root_path
    assert_template 'posts/index'
    # assert_select "p.post-content"
    assert_select "p.post-author", count: 0
  end

  # test "post author is listed when user is signed in" do
  #   sign_in users(:madeline)
  #   get root_path
  #   assert_template 'posts/index'
  #   assert_select "p.post-content"
  #   assert_select "p.post-author"
  # end
end
