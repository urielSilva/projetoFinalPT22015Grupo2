require 'test_helper'

class ProjectMemberHistoriesControllerTest < ActionController::TestCase
  setup do
    @project_member_history = project_member_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_member_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_member_history" do
    assert_difference('ProjectMemberHistory.count') do
      post :create, project_member_history: { observation: @project_member_history.observation, project_id: @project_member_history.project_id, project_role_id: @project_member_history.project_role_id, user_id: @project_member_history.user_id }
    end

    assert_redirected_to project_member_history_path(assigns(:project_member_history))
  end

  test "should show project_member_history" do
    get :show, id: @project_member_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_member_history
    assert_response :success
  end

  test "should update project_member_history" do
    patch :update, id: @project_member_history, project_member_history: { observation: @project_member_history.observation, project_id: @project_member_history.project_id, project_role_id: @project_member_history.project_role_id, user_id: @project_member_history.user_id }
    assert_redirected_to project_member_history_path(assigns(:project_member_history))
  end

  test "should destroy project_member_history" do
    assert_difference('ProjectMemberHistory.count', -1) do
      delete :destroy, id: @project_member_history
    end

    assert_redirected_to project_member_histories_path
  end
end
