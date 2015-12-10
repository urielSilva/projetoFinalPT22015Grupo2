require 'test_helper'

class KnowledgesUsersControllerTest < ActionController::TestCase
  setup do
    @knowledges_user = knowledges_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledges_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledges_user" do
    assert_difference('KnowledgesUser.count') do
      post :create, knowledges_user: { knowledge_id: @knowledges_user.knowledge_id, user_id: @knowledges_user.user_id }
    end

    assert_redirected_to knowledges_user_path(assigns(:knowledges_user))
  end

  test "should show knowledges_user" do
    get :show, id: @knowledges_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledges_user
    assert_response :success
  end

  test "should update knowledges_user" do
    patch :update, id: @knowledges_user, knowledges_user: { knowledge_id: @knowledges_user.knowledge_id, user_id: @knowledges_user.user_id }
    assert_redirected_to knowledges_user_path(assigns(:knowledges_user))
  end

  test "should destroy knowledges_user" do
    assert_difference('KnowledgesUser.count', -1) do
      delete :destroy, id: @knowledges_user
    end

    assert_redirected_to knowledges_users_path
  end
end
