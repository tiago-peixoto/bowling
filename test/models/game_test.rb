require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid game' do
    game = Game.new
    game.save
    assert_not_nil game.id 
  end
end
