require './board.rb'
require './player.rb'

class PlayGame
    def initialize
        @player1 = createPlayer(1)
        @player2 = createPlayer(2)
        @board = Board.new
        play_round
    end

    def createPlayer(player_num)
        print "Enter player #{player_num} name: "
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

    def make_a_move(player)
        @board.print_board
        puts "#{player.name} it's your turn!"

        prompt = "Please enter a row number (0-2): "
        row = get_valid_data(prompt, nil, ("0".."2"))

        prompt = "Please enter a column number (0-2): "
        column = get_valid_data(prompt, nil, ("0".."2"))

        @board.board[row.to_i][column.to_i] = player.letter
    end

    def random_player
        one_or_two = rand 1..2
        if one_or_two == 1
            return @player1
        else
            return @player2
        end
    end

    def play_round
        current_player = random_player

        while no_winner? && @board.not_full?
            make_a_move(current_player)
            if current_player == @player1
                current_player = @player2
            else
                current_player = @player1
            end
        end
    end

    def no_winner?
        win_info = @board.check_for_win

        if win_info[1].nil?
            return true
        else
            if @player1.letter = win_info[1]
                puts "#{@player1.name} has won on #{win_info[0]}!"
            else
                puts "#{@player2.name} has won on #{win_info[0]}!"
            end
            
            return false
        end
    end
end

game = PlayGame.new()