require_relative '../lib/studio_game/game'
require_relative '../lib/studio_game/clumsy_player'
require_relative '../lib/studio_game/berserk_player'

player1 = StudioGame::Player.new("bob")
player2 = StudioGame::Player.new("larry", 60)
player3 = StudioGame::Player.new("curly", 125)
player4 = StudioGame::ClumsyPlayer.new("klutz", 105)
player5 = StudioGame::BerserkPlayer.new("berzerker", 50)

knuckleheads = StudioGame::Game.new("Knuckleheads")
default_path = File.join(File.dirname(__FILE__), "favorite_players.csv")
knuckleheads.load_players(ARGV.shift || default_path)
knuckleheads.add_player(player4)
knuckleheads.add_player(player5)

loop do 
	puts "\nHow many rounds would you like to play?"
	answer = gets.chomp.downcase

	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when "exit", "quit"
		knuckleheads.print_stats
		knuckleheads.save_scores
		break
	else
		puts "Please enter a number or quit"
	end

end


