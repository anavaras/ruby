require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get indx" do
    get welcome_indx_url
    assert_response :success
  end

end
