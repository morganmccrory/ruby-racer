require_relative 'ruby_racer.rb'

players = ['a', 'b']
game = RubyRacer.new(players)
game.reset_screen!
until game.finished? == true
  players.each do |player|
    game.print_board
    game.advance_player!(player)
    sleep(0.5)
  end
end

game.print_board
puts "Player '#{game.winner}' has won!"