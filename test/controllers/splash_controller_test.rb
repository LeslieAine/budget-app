require 'test_helper'

class SplashControllerTest < ActionDispatch::IntegrationTest
  test 'should get splash' do
    get splash_splash_url
    assert_response :success
  end
end
