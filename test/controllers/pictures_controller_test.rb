require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pictures_create_url
    assert_response :success
  end

end
