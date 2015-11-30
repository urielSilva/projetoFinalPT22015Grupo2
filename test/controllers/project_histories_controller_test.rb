require 'test_helper'

class ProjectHistoriesControllerTest < ActionController::TestCase
  setup do
    @project_history = project_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_history" do
    assert_difference('ProjectHistory.count') do
      post :create, project_history: { observation: @project_history.observation, project_id: @project_history.project_id, project_status_id: @project_history.project_status_id }
    end

    assert_redirected_to project_history_path(assigns(:project_history))
  end

  test "should show project_history" do
    get :show, id: @project_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_history
    assert_response :success
  end

  test "should update project_history" do
    patch :update, id: @project_history, project_history: { observation: @project_history.observation, project_id: @project_history.project_id, project_status_id: @project_history.project_status_id }
    assert_redirected_to project_history_path(assigns(:project_history))
  end

  test "should destroy project_history" do
    assert_difference('ProjectHistory.count', -1) do
      delete :destroy, id: @project_history
    end

    assert_redirected_to project_histories_path
  end
end
