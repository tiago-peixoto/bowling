require 'test_helper'

class ThrowsControllerTest < ActionDispatch::IntegrationTest

  test "should post create" do
    Game.create!(id: 1)
    post '/games/1/throws', params: { pins_down: 10 }
    assert_response :success
  end
end
