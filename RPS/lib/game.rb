class Game

  OUTCOME = {
    rock: { rock: :draw, paper: :lose, scissors: :win },
    paper: { rock: :win, paper: :draw, scissors: :lose },
    scissors: { rock: :lose, paper: :win, scissors: :draw },
  }

  attr_reader :player_name, :player_shape, :computer_shape

  def initialize(options)
    @player_name = options['player_name']
    @player_shape = options['player_shape']
    @computer_shape = options['computer_shape']
  end

  def win?
    result == :win
  end

  private 

  def result
    OUTCOME[@player_shape][@computer_shape]
  end

end
