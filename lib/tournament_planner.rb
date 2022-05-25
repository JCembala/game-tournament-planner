# frozen_string_literal: false

require_relative 'game_tournament'

# Holds information about tournament
# It have a list of players and games
class TournamentPlanner
  def initialize(players, games)
    @players = players.sort_by(&:sign_up_at)
    @games = games.sort_by(&:priority).reverse
    @game_tournaments = []
    @excluded_games = []
  end

  def plan_tournament
    @games.each do |game|
      players_for_current_game = []
      @players.each do |player|
        break if players_for_current_game.length >= game.max_player_count

        players_for_current_game << player if player.games.include? game
      end

      if players_for_current_game.length < 2
        @excluded_games << game
      else
        @players -= @players & players_for_current_game
        @game_tournaments << GameTournament.new(game, players_for_current_game)
      end
    end
  end

  def print_game_tournaments
    @game_tournaments.each { |tournament| puts tournament if tournament.enough_players? }
  end

  def print_excluded_games
    puts @excluded_games
  end
end
