require "test_helper"

class UserPreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_preferences_new_url
    assert_response :success
  end

  test "should get create" do
    get user_preferences_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_preferences_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_preferences_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_preferences_destroy_url
    assert_response :success
  end
end
