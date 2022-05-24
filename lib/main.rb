# frozen_string_literal: false

# There is a board games day scheduled and organizers would like to automatically
# get a list of all game tournaments & players that will take place during that day
# according to the preference of the attendees.

require_relative 'tournament_planner'

games = []
10.times { |i| games << Game.new("Game #{i}", rand(1..11), rand(2..5)) }

players = []
30.times { |i| players << Player.new("Player #{i}", games.sample(rand(3..11))) }

tournament = TournamentPlanner.new(players, games)

tournament.plan_tournament
puts
tournament.print_game_tournaments

puts 'Excluded games:'
tournament.print_excluded_games
