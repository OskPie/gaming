class Game < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :user, optional: true
  has_many :machine_games, dependent: :destroy
  has_many :computers, through: :machine_games

  validates :title, presence: true
  validates :game_progress, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def game_in_progress
    number_to_percentage(game_progress, precision: 2)
  end
end
