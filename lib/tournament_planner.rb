# frozen_string_literal: false

require_relative 'game_tournament'

# Holds information about tournament
# It have a list of players and games
class TournamentPlanner
  def initialize(players, games)
    @players = players
    @games = games
    @game_tournaments = []
  end

  def plan_tournament
    @games.each do |game|
      # Only players that will play this particular game?
      @game_tournaments << GameTournament.new(game, @players)
    end
  end
end
