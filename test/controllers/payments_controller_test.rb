require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should get stripe" do
    get :stripe
    assert_response :success
  end

end
