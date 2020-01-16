class Game < ApplicationRecord
  has_many :throws, dependent: :destroy

  def score
    throws
    .map() { |throw| throw.pins_down }
    .reduce(0) { |acc, pins_down| acc + pins_down }
  end

  def frames
    throws
    .map() { |throw| throw.pins_down }
    .reduce([]) do |acc, pins_down|
      if acc.last && acc.last.reduce(:+) < 10 && acc.last.count < 2
        acc.last << pins_down
      else
        acc << [pins_down]
      end
      acc
    end
  end
end
