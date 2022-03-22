require "test_helper"

class PoohsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get poohs_new_url
    assert_response :success
  end

  test "should get create" do
    get poohs_create_url
    assert_response :success
  end

  test "should get update" do
    get poohs_update_url
    assert_response :success
  end

  test "should get delete" do
    get poohs_delete_url
    assert_response :success
  end
end
