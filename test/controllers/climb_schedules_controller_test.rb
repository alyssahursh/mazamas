require 'test_helper'

class ClimbSchedulesControllerTest < ActionController::TestCase
  setup do
    @climb_schedule = climb_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climb_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climb_schedule" do
    assert_difference('ClimbSchedule.count') do
      post :create, climb_schedule: {  }
    end

    assert_redirected_to climb_schedule_path(assigns(:climb_schedule))
  end

  test "should show climb_schedule" do
    get :show, id: @climb_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climb_schedule
    assert_response :success
  end

  test "should update climb_schedule" do
    patch :update, id: @climb_schedule, climb_schedule: {  }
    assert_redirected_to climb_schedule_path(assigns(:climb_schedule))
  end

  test "should destroy climb_schedule" do
    assert_difference('ClimbSchedule.count', -1) do
      delete :destroy, id: @climb_schedule
    end

    assert_redirected_to climb_schedules_path
  end
end
