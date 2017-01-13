require 'test_helper'

class ClimbTagsControllerTest < ActionController::TestCase
  setup do
    @climb_tag = climb_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climb_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climb_tag" do
    assert_difference('ClimbTag.count') do
      post :create, climb_tag: {  }
    end

    assert_redirected_to climb_tag_path(assigns(:climb_tag))
  end

  test "should show climb_tag" do
    get :show, id: @climb_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climb_tag
    assert_response :success
  end

  test "should update climb_tag" do
    patch :update, id: @climb_tag, climb_tag: {  }
    assert_redirected_to climb_tag_path(assigns(:climb_tag))
  end

  test "should destroy climb_tag" do
    assert_difference('ClimbTag.count', -1) do
      delete :destroy, id: @climb_tag
    end

    assert_redirected_to climb_tags_path
  end
end
