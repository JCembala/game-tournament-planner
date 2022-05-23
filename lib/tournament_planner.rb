# frozen_string_literal: false

require_relative 'game_tournament'

# Holds information about tournament
# It have a list of players and games
class TournamentPlanner
  def initialize(players, games)
    @players = players
    @games = games.sort_by(&:priority).reverse
    @game_tournaments = []
  end

  def plan_tournament
    @games.each do |game|
      # Only players that will play this particular game?
      @game_tournaments << GameTournament.new(game, @players)
    end
  end

  def print_game_tournaments
    @game_tournaments.each { |tournament| puts tournament if tournament.enough_players? }
  end

  def excluded_games
    # return excluded games
  end
end
