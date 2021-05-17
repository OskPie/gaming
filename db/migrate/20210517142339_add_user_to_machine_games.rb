class AddUserToMachineGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :machine_games, :user, foreign_key: true
  end
end
