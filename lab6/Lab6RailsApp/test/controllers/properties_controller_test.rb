require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get properties_buy_url
    assert_response :success
  end

  test "should get rent" do
    get properties_rent_url
    assert_response :success
  end

  test "should get daily" do
    get properties_daily_url
    assert_response :success
  end
end
