require "test_helper"

class HostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new_listing" do
    get hosts_new_listing_url
    assert_response :success
  end
end
