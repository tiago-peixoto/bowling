class Game < ApplicationRecord
  has_many :throws, dependent: :destroy

  def score
    total = 0
    frames = {}
    cursor = 0
    10.times do |index|
      if is_strike(cursor)
        frames[index] = {
          throws: [10],
          score: 10 + pins_down_on(cursor + 1) + pins_down_on(cursor + 2)
        }
        total += frames[index][:score]
        cursor += 1
      elsif is_spair(cursor)
        frames[index] = {
          throws: [pins_down_on(cursor), pins_down_on(cursor + 1)],
          score: 10 + pins_down_on(cursor + 2)
        }
        total += frames[index][:score]
        cursor += 2
      else 
        frames[index] = {
          throws: [pins_down_on(cursor), pins_down_on(cursor + 1)],
          score: pins_down_on(cursor) + pins_down_on(cursor + 1)
        }
        total += frames[index][:score]
        cursor += 2
      end
    end
    {
      total: total,
      frames: frames
    }
  end

  private

  def is_strike(cursor)
    pins_down_on(cursor) === 10
  end

  def is_spair(cursor)
    (pins_down_on(cursor) + pins_down_on(cursor + 1)) === 10
  end

  def pins_down_on(cursor)
    throws[cursor] ? throws[cursor].pins_down : 0
  end
end
