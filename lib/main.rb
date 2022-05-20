# frozen_string_literal: false

require_relative 'tournament_planner'

games = [
  Game.new('Cards 1', 5, 4),
  Game.new('Cards 2', 4, 2)
]

players = [
  Player.new('Adam', [games[0], games[1]]),
  Player.new('Jan', [games[0]])
]

tournament = TournamentPlanner.new(players, games)

tournament.plan_tournament
players.each { |player| puts player }
