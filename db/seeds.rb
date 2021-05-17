FactoryBot.create_list(:user, 50)
User.find_each do |user|
  FactoryBot.create_list(:computer, rand(1..4), user: user)
end

User.find_each do |user|
  FactoryBot.create_list(:game, rand(1..4), user: user)
end

User.find_each do |user|
  FactoryBot.create(:machine_game, game: user.games.sample, computer: user.computers.sample)
end
