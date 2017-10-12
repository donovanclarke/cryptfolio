require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get list" do
    get static_pages_list_url
    assert_response :success
  end

  test "should get settings" do
    get static_pages_settings_url
    assert_response :success
  end

end
