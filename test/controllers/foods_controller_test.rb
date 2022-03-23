require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get foods_show_url
    assert_response :success
  end

  test "should get new" do
    get foods_new_url
    assert_response :success
  end

  test "should get create" do
    get foods_create_url
    assert_response :success
  end

  test "should get delete" do
    get foods_delete_url
    assert_response :success
  end
end
