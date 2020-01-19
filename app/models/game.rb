class Game < ApplicationRecord
  has_many :throws, dependent: :destroy

  def score
    result = 0
    cursor = 0
    10.times do
      if pins_down_on(cursor) === 10
        result += 10 + pins_down_on(cursor + 1) + pins_down_on(cursor + 2)
        cursor += 1
      elsif (pins_down_on(cursor) + pins_down_on(cursor + 1)) === 10
        result += 10 + pins_down_on(cursor + 2)
        cursor += 2
      else
        result += pins_down_on(cursor) + pins_down_on(cursor + 1)
        cursor += 2
      end
    end
    result
  end

  private

  def pins_down_on(cursor)
    throws[cursor] ? throws[cursor].pins_down : 0
  end
end
