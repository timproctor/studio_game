require_relative 'treasure_trove'
require_relative 'playable'
module StudioGame
  class Player
    include Playable
    attr_reader :name
    attr_accessor :health

    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def to_s
      "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
    end

    # def w00t
    #   @health += 15
    #   puts "#{@name} got w00ted!"
    # end

    def self.from_csv(string)
      name = string.split(',')[0]
      health = string.split(',')[1]
      Player.new(name, Integer(health))
    end

    # def blam
    #   @health -= 10
    #   puts "#{@name} got blammed!"
    # end

    def score
      @health + points
    end

    def name=(new_name)
      @name = new_name.capitalize
    end

    # def strong?
    #   @health > 100
    # end

    def <=>(other)
      other.score <=> score
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        yield Treasure.new(name, points)
      end
    end
  end
end

# if __File__ == $0
#   player = Player.new("moe")
#   puts player.name
#   puts player.health
#   player.w00t
#   puts player.health
#   player.blam
#   puts player.health
# end
