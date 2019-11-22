class RPSGame
  attr_accessor :human, :computer

  def initialiize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human_choose_move
    computer_choose_move
    display_winner
    display_goodbye_message
  end
end

class Player
  def initialiize(name)
    @name = name
  end

  def choose
  end
end

class Move
  def initialiize
  end
end

class Rule
  def initialiize
  end
end

def compare(move1, move2)
end