require 'test_helper'

class ThrowTest < ActiveSupport::TestCase

  test 'Throw with string value should fail' do
    game = Game.create!()
    assert_raise do
      game.throws.create!({ pins_down: 'ten' })
    end
  end

  test 'Throw with 11 value should fail' do
    game = Game.create!()
    assert_raise do
      game.throws.create!({ pins_down: 11 })
    end
  end

  test 'Throw with -1 value should fail' do
    game = Game.create!()
    assert_raise do
      game.throws.create!({ pins_down: -1 })
    end
  end

  test 'Throw with 2.5 value should fail' do
    game = Game.create!()
    assert_raise do
      game.throws.create!({ pins_down: 2.5 })
    end
  end
end
