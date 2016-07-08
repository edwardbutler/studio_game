require 'studio_game/game'

module StudioGame

  describe Game do

    before do
      @game = StudioGame::Game.new("Knuckleheads")

      @initial_health = 100
      @player = StudioGame::Player.new("moe", @initial_health)
      
      @game.add_player(@player)
    end

    it 'player w00ts when high number is rolled' do
    	StudioGame::Die.any_instance.stub(:roll).and_return(5)
    	@game.play(2)
    	@player.health.should == @initial_health + (15 * 2)
    end

    it 'player skips when medium number is rolled' do
    	StudioGame::Die.any_instance.stub(:roll).and_return(3)
    	@game.play(2)
    	@player.health.should == @initial_health
    end

    it 'player blams when lower number is rolled' do
    	StudioGame::Die.any_instance.stub(:roll).and_return(1)
    	@game.play(2)
    	@player.health.should == @initial_health - (10 * 2)
    end

    it "assigns a treasure for points during a player's turn" do
      game = StudioGame::Game.new("Knuckleheads")
      player = StudioGame::Player.new("moe")

      game.add_player(player)

      game.play(1)

      player.points.should_not be_zero

    end

    it "computes total points as the sum of all player points" do
      game = StudioGame::Game.new("Knuckleheads")

      player1 = StudioGame::Player.new("moe")
      player2 = StudioGame::Player.new("larry")

      game.add_player(player1)
      game.add_player(player2)

      player1.found_treasure(StudioGame::Treasure.new(:hammer, 50))
      player1.found_treasure(StudioGame::Treasure.new(:hammer, 50))
      player2.found_treasure(StudioGame::Treasure.new(:crowbar, 400))

      game.total_points.should == 500
    end
    
  end
end