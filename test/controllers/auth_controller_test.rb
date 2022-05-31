require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get signup_form" do
    get auth_signup_form_url
    assert_response :success
  end

  test "should get signup" do
    get auth_signup_url
    assert_response :success
  end

  test "should get signin" do
    get auth_signin_url
    assert_response :success
  end

  test "should get signin_form" do
    get auth_signin_form_url
    assert_response :success
  end
end
