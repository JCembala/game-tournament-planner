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
    taken_players = []
    @games.each do |game|
      # Only players that want to play this game
      players_for_game = @players.select { |player| player.games.include? game }
      # Removing players who are playing something else
      players_for_game.delete_if { |player| taken_players.include? player }

      players_for_game = players_for_game[0, game.max_player_count] if players_for_game.length > game.max_player_count

      taken_players = (taken_players + players_for_game).uniq
      @game_tournaments << GameTournament.new(game, players_for_game)
    end
  end

  def print_game_tournaments
    @game_tournaments.each { |tournament| puts tournament if tournament.enough_players? }
  end

  def excluded_games
    # return excluded games
  end
end
