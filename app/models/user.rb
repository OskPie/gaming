class User < ApplicationRecord
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :computers
  has_many :games
  has_many :machine_games

  validates :email, presence: true, format: { with: EMAIL_FORMAT }

  def games_counter
    games.count
  end
end
