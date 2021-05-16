class Game < ApplicationRecord
  validates :title, presence: true
  validates :game_progress, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
