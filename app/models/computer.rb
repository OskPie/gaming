class Computer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :machine_games, dependent: :destroy
  has_many :games, through: :machine_games

  validates :name, presence: true

  before_save :generate_uuid

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
