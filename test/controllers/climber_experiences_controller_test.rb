require 'test_helper'

class ClimberExperiencesControllerTest < ActionController::TestCase
  setup do
    @climber_experience = climber_experiences(:ClimberExperience_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climber_experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climber_experience" do
    assert_difference('ClimberExperience.count') do
      post :create, climber_experience: {  }
    end

    assert_redirected_to climber_experience_path(assigns(:climber_experience))
  end

  test "should show climber_experience" do
    get :show, id: @climber_experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climber_experience
    assert_response :success
  end

  test "should update climber_experience" do
    patch :update, id: @climber_experience, climber_experience: {  }
    assert_redirected_to climber_experience_path(assigns(:climber_experience))
  end

end
