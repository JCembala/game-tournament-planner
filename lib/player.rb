# frozen_string_literal: false

require 'date'

# Holds information about player
class Player
  attr_accessor :games, :name, :sign_up_at

  def initialize(name, games = [])
    @name = name
    @games = games
    @sign_up_at = Time.new + rand(1..1200)
  end

  def to_s
    @name
  end
end
