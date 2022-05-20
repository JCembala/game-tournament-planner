# frozen_string_literal: false

require_relative 'game'
require_relative 'player'

# Holds information about game tournament
# Have a game, and list of players that will playing it that day
class GameTournament
  def initialize(game, players)
    @game = game
    @players = players
  end
end
