# frozen_string_literal: false

require_relative 'game_tournament'

# Holds information about tournament
# It have a list of players and games
class TournamentPlanner
  def initialize(players, games)
    @players = players
    @games = games.sort_by(&:priority).reverse
    @game_tournaments = []
    @chosen_games = []
  end

  def plan_tournament
    taken_players = []
    @games.each do |game|
      # Chosing players that want to play this game
      players_for_game = @players.select { |player| player.games.include? game }
      # Add game which players want to play
      @chosen_games << game unless players_for_game.empty? || @chosen_games.include?(game)
      # Removing players who are playing something else
      players_for_game.delete_if { |player| taken_players.include? player }

      players_for_game = players_for_game[0, game.max_player_count] if players_for_game.length > game.max_player_count

      # Create only tournaments that has enough players to be played
      if players_for_game.length >= 2
        taken_players = (taken_players + players_for_game).uniq
        @game_tournaments << GameTournament.new(game, players_for_game)
      end
    end
  end

  def print_game_tournaments
    @game_tournaments.each { |tournament| puts tournament if tournament.enough_players? }
  end

  def print_excluded_games
    excluded = @chosen_games.clone
    @game_tournaments.each { |tournament| excluded.delete tournament.game }
    puts excluded
  end
end
