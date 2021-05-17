class CreateMachineGames < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_games do |t|
      t.references :game, foreign_key: true
      t.references :computer, foreign_key: true

      t.timestamps
    end
  end
end
