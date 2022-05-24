# frozen_string_literal: false

# There is a board games day scheduled and organizers would like to automatically
# get a list of all game tournaments & players that will take place during that day
# according to the preference of the attendees.

require_relative 'tournament_planner'

games = [
  Game.new('Cards 1', 5, 4),
  Game.new('Cards 2', 10, 2),
  Game.new('Cards 3', 4, 2),
  Game.new('Cards 4', 4, 2),
  Game.new('Cards 5', 4, 3),
  Game.new('Cards 6', 4, 3),
  Game.new('Cards 7', 5, 3),
  Game.new('Cards 8', 6, 2),
  Game.new('Cards 9', 6, 2),
  Game.new('Cards 10', 10, 2)
]

players = [
  Player.new('Adam A', [games[5], games[6], games[7]]),
  Player.new('Adam B', [games[5], games[7]]),
  Player.new('Adam C', [games[0], games[6]]),
  Player.new('Adam D', [games[7], games[4]]),
  Player.new('Adam E', [games[6], games[4]]),
  Player.new('Adam F', [games[1], games[3]]),
  Player.new('Adam G', [games[1], games[3]]),
  Player.new('Adam H', [games[4]])
]

tournament = TournamentPlanner.new(players, games)

tournament.plan_tournament
puts
tournament.print_game_tournaments

puts 'Excluded games:'
tournament.print_excluded_games
