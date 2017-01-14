require 'test_helper'

class ClimbLeaderProfilesControllerTest < ActionController::TestCase
  setup do
    @climb_leader_profile = climb_leader_profiles(:ClimbLeaderProfile_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climb_leader_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climb_leader_profile" do
    assert_difference('ClimbLeaderProfile.count') do
      post :create, climb_leader_profile: {  }
    end

    assert_redirected_to climb_leader_profile_path(assigns(:climb_leader_profile))
  end

  test "should show climb_leader_profile" do
    get :show, id: @climb_leader_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climb_leader_profile
    assert_response :success
  end

  test "should update climb_leader_profile" do
    patch :update, id: @climb_leader_profile, climb_leader_profile: {  }
    assert_redirected_to climb_leader_profile_path(assigns(:climb_leader_profile))
  end

end
