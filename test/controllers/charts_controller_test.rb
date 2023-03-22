require "test_helper"

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get linechart" do
    get charts_linechart_url
    assert_response :success
  end
end
