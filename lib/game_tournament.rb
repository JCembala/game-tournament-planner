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

  def enough_players?
    @players.count >= 2
  end

  def to_s
    players_str = ''
    @players.each { |player| players_str += "#{player} " }
    "Game: #{@game.name} \nPlayers: " + "#{players_str}\n\n"
  end
end
