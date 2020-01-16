require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest

  test "should post create" do
    post '/games'
    assert_response :success
  end

  test "should get show" do
    get '/games/1'
    assert_response :not_found
  end
end
