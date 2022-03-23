require "test_helper"

class MealIngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get meal_ingredients_new_url
    assert_response :success
  end

  test "should get create" do
    get meal_ingredients_create_url
    assert_response :success
  end

  test "should get edit" do
    get meal_ingredients_edit_url
    assert_response :success
  end

  test "should get update" do
    get meal_ingredients_update_url
    assert_response :success
  end

  test "should get delete" do
    get meal_ingredients_delete_url
    assert_response :success
  end
end
