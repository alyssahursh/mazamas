require 'test_helper'

class ClimberEducationsControllerTest < ActionController::TestCase
  setup do
    @climber_education = climber_educations(:ClimberEducation_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climber_educations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climber_education" do
    assert_difference('ClimberEducation.count') do
      post :create, climber_education: {  }
    end

    assert_redirected_to climber_education_path(assigns(:climber_education))
  end

  test "should show climber_education" do
    get :show, id: @climber_education
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climber_education
    assert_response :success
  end

  test "should update climber_education" do
    patch :update, id: @climber_education, climber_education: {  }
    assert_redirected_to climber_education_path(assigns(:climber_education))
  end

end
