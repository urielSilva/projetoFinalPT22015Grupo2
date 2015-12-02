require 'test_helper'

class ActivitiesUsersControllerTest < ActionController::TestCase
  setup do
    @activities_user = activities_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activities_user" do
    assert_difference('ActivitiesUser.count') do
      post :create, activities_user: { activity_id: @activities_user.activity_id, user_id: @activities_user.user_id }
    end

    assert_redirected_to activities_user_path(assigns(:activities_user))
  end

  test "should show activities_user" do
    get :show, id: @activities_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activities_user
    assert_response :success
  end

  test "should update activities_user" do
    patch :update, id: @activities_user, activities_user: { activity_id: @activities_user.activity_id, user_id: @activities_user.user_id }
    assert_redirected_to activities_user_path(assigns(:activities_user))
  end

  test "should destroy activities_user" do
    assert_difference('ActivitiesUser.count', -1) do
      delete :destroy, id: @activities_user
    end

    assert_redirected_to activities_users_path
  end
end
