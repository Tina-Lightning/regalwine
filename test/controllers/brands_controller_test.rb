require 'test_helper'

class BrandsControllerTest < ActionController::TestCase
  test "should get tech_sheet" do
    get :tech_sheet
    assert_response :success
  end

end
