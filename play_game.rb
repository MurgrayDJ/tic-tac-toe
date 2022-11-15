require './board.rb'
require './player.rb'

class PlayGame
    def initialize
        player1 = createPlayer
        player2 = createPlayer
        board = Board.new
    end

    def createPlayer
        print "Enter name: "
        name = gets
        print "Enter letter: "
        letter = gets
        player = Player.new(name, letter)
    end
end

game = PlayGame.new()