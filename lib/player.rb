# frozen_string_literal: false

require 'date'

# Holds information about player
class Player
  def initialize(name, games = [])
    @name = name
    @games = games
    @sign_up_at = DateTime.now
  end

  def to_s
    "Player name: #{@name}\n#{@sign_up_at.strftime("created at: %m/%d/%Y %I:%M%p")}\n#{@games.to_s}"
  end
end
