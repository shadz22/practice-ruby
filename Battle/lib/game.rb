# frozen_string_literal: true

class Game
  attr_reader :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def attack(player)
    player.receive_damage
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turn
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(current_turn)
    @players.reject { |player| player == current_turn }.first
  end

  private

  attr_reader :players
end
