require 'test_helper'

class KnowledgeRequestsControllerTest < ActionController::TestCase
  setup do
    @knowledge_request = knowledge_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_request" do
    assert_difference('KnowledgeRequest.count') do
      post :create, knowledge_request: { knowledge_id: @knowledge_request.knowledge_id, user_id: @knowledge_request.user_id }
    end

    assert_redirected_to knowledge_request_path(assigns(:knowledge_request))
  end

  test "should show knowledge_request" do
    get :show, id: @knowledge_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledge_request
    assert_response :success
  end

  test "should update knowledge_request" do
    patch :update, id: @knowledge_request, knowledge_request: { knowledge_id: @knowledge_request.knowledge_id, user_id: @knowledge_request.user_id }
    assert_redirected_to knowledge_request_path(assigns(:knowledge_request))
  end

  test "should destroy knowledge_request" do
    assert_difference('KnowledgeRequest.count', -1) do
      delete :destroy, id: @knowledge_request
    end

    assert_redirected_to knowledge_requests_path
  end
end
