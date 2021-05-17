class MachineGame < ApplicationRecord
  belongs_to :game
  belongs_to :computer
  belongs_to :user

  validates :game, :computer, :user, presence: true
  validates :computer, uniqueness: { scope: :game, message: 'already had this game installed' }
end
