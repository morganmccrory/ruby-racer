require_relative 'die.rb'

class RubyRacer
  attr_reader :players, :length

  def initialize(players, length = 30)
    @players_hash = {}
    @length = length
    players.each do |name|
      @players_hash[name] = 0
    end
  end

# Returns +true+ if one of the players has reached
# the finish line, +false+ otherwise
  def finished?
    @players_hash.any? do |player, position|
      if position >= (@length-1)
        true
      else
        false
      end
    end
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @players_hash.each do |player, position|
      if position >= (@length-1)
        return player
      end
    end
  end

  # Rolls the dice and advances +player+ accordingly
  def advance_player!(player)
    dice = Die.new
    dice.roll
    @players_hash[player] += dice.roll
  end

  # Prints the current game board
  # The board should have the same dimensions each time
  # and you should print over the previous board
  def print_board
    @players_hash.each do |name, position|
      if position >= length
        position = length-1
      end
      board = Array.new(length.times.map{' '})
      board.insert(position, name)
      p board.join(" | ")
    end
  end

  #Clears the content on the screen. Ah, a fresh canvas.
  #You don't have to test this
  def clear_screen!
    print "\e[2J"
  end

  #Moves the "cursor" back to the upper left.
  #You don't have to test this
  def move_to_home!
    print "\e[H"
  end

  #You don't have to test this
  def reset_screen!
    clear_screen!
    move_to_home!
  end
end