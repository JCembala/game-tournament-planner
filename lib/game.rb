# frozen_string_literal: false

# Holds information about game
class Game
  def initialize(name, priority = 1, max_player_count = 2)
    @name = name
    @priority = priority
    @max_player_count = max_player_count < 2 ? 2 : max_player_count
  end

  def to_s
    "#{@name}\nPriority: #{@priority}\nMax player: #{@max_player_count}"
  end
end
