require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test 'Game starts successfully' do
    game = Game.new
    game.save
    assert_not_nil game.id 
  end

  test 'Game starts with score 0' do
    game = Game.new
    game.save
    assert_equal(0, game.score) 
  end

  test 'Game scores correctly for first throw' do
    game = Game.new
    game.save
    game.throws.create!({ pins_down: 3 })
    assert_equal(3, game.score) 
  end

  test 'Game scores correctly for spare' do
    game = Game.new
    game.save
    game.throws.create!({ pins_down: 2 })
    game.throws.create!({ pins_down: 8 })
    game.throws.create!({ pins_down: 4 })
    assert_equal(18, game.score) 
  end

  test 'Game scores correctly for strike' do
    game = Game.new
    game.save
    game.throws.create!({ pins_down: 10 })
    game.throws.create!({ pins_down: 10 })
    game.throws.create!({ pins_down: 10 })
    game.throws.create!({ pins_down: 2 })
    game.throws.create!({ pins_down: 3 })
    assert_equal(72, game.score) 
  end

  test 'Game scores correctly for perfect game' do
    game = Game.new
    game.save
    12.times do
      game.throws.create!({ pins_down: 10 })
    end
    assert_equal(300, game.score) 
  end
end
