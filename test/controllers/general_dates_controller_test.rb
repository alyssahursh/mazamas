require 'test_helper'

class GeneralDatesControllerTest < ActionController::TestCase
  setup do
    @general_date = general_dates(:GeneralDate_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_date" do
    assert_difference('GeneralDate.count') do
      post :create, general_date: {  }
    end

    assert_redirected_to general_date_path(assigns(:general_date))
  end

  test "should show general_date" do
    get :show, id: @general_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general_date
    assert_response :success
  end

  test "should update general_date" do
    patch :update, id: @general_date, general_date: {  }
    assert_redirected_to general_date_path(assigns(:general_date))
  end

end
