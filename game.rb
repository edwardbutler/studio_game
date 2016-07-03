require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game

	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		#@players.push(player)
		@players << player
	end

	def play(rounds)

		puts "There are #{@players.size} players in #{@title}: "

		@players.each do |player|
				puts player
		end

		1.upto(rounds) do |turn|

			puts "\nRound: #{turn}"

			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
		
	end


end
