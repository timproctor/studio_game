require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
module StudioGame
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      case die.roll
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.blam
      end

      treasure = TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end
