# frozen_string_literal: false

# Holds information about game
class Game
  attr_accessor :name, :priority, :max_player_count

  def initialize(name, priority = 1, max_player_count = 2)
    @name = name
    @priority = priority
    @max_player_count = max_player_count < 2 ? 2 : max_player_count
  end

  def to_s
    @name
  end
end
