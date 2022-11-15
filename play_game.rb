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
        name = gets.chomp

        letter = get_valid_data("Enter a letter: ", nil, ("A".."z")).upcase

        player = Player.new(name, letter)
    end

    def get_valid_data(prompt, response, valid_responses)
        if response.nil?
            print prompt
            response = gets.chomp
        else
            valid_responses.each do |valid_response|
                if response == valid_response
                    return response
                end
            end
            response = nil
        end
        response = get_valid_data(prompt, response, valid_responses)  
    end
end

game = PlayGame.new()