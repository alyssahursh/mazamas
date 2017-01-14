require 'test_helper'

class ClimbClassesControllerTest < ActionController::TestCase
  setup do
    @climb_class = climb_classes(:ClimbClass_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climb_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climb_class" do
    assert_difference('ClimbClass.count') do
      post :create, climb_class: {  }
    end

    assert_redirected_to climb_class_path(assigns(:climb_class))
  end

  test "should show climb_class" do
    get :show, id: @climb_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climb_class
    assert_response :success
  end

  test "should update climb_class" do
    patch :update, id: @climb_class, climb_class: {  }
    assert_redirected_to climb_class_path(assigns(:climb_class))
  end

end
