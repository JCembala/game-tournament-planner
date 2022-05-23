# frozen_string_literal: false

require 'date'

# Holds information about player
class Player
  attr_accessor :games, :name

  def initialize(name, games = [])
    @name = name
    @games = games
    @sign_up_at = DateTime.now
  end
end