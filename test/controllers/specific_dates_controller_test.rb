require 'test_helper'

class SpecificDatesControllerTest < ActionController::TestCase
  setup do
    @specific_date = specific_dates(:SpecificDate_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specific_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specific_date" do
    assert_difference('SpecificDate.count') do
      post :create, specific_date: {  }
    end

    assert_redirected_to specific_date_path(assigns(:specific_date))
  end

  test "should show specific_date" do
    get :show, id: @specific_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specific_date
    assert_response :success
  end

  test "should update specific_date" do
    patch :update, id: @specific_date, specific_date: {  }
    assert_redirected_to specific_date_path(assigns(:specific_date))
  end

end
