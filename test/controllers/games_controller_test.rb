require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest

  test "should post create a game" do
    post '/games'
    assert_response :success
  end

  test "should get show" do
    get '/games/1'
    assert_response :not_found
  end

  test "should get show an existing game" do
    Game.create!(id: 1)
    get '/games/1'
    assert_response :success
  end
end
