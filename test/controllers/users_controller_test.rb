require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:madeline)
  end

  test "should get new" do
    get new_user_registration_path
    assert_response :success
  end
end
