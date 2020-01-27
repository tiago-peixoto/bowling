class Throw < ApplicationRecord
  belongs_to :game

  validates :pins_down, numericality: { 
    only_integer: true, 
    less_than: 11, 
    greater_than_or_equal_to: 0 
  }
end
