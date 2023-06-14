require './board.rb'
require './player.rb'

class PlayGame
    def initialize
        puts "Welcome to Tic-Tac-Toe! Please enter the following player data: "
        @player1 = createPlayer(1)
        @player2 = createPlayer(2)
        @board = Board.new

        puts "Hi #{@player1.name} and #{@player2.name}! Let's get started!"
        play_round
    end

    def createPlayer(player_num)
        name = ''
        while !name.match?(/\A[a-zA-Z'-]+\z/)
            print "Enter player #{player_num} name: "
            name = gets.chomp
        end

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
                elsif response.downcase == "exit"
                    puts "See ya later!"
                    exit!
                end
            end
            response = nil
        end
        response = get_valid_data(prompt, response, valid_responses)  
    end

    def make_a_move(player)
        @board.print_board
        puts "#{player.name} it's your turn!"
        chosen_spot = " "

        while chosen_spot.strip.empty?
            prompt = "Please enter a row number (0-2): "
            row = get_valid_data(prompt, nil, ("0".."2"))

            prompt = "Please enter a column number (0-2): "
            column = get_valid_data(prompt, nil, ("0".."2"))
            
            chosen_spot = @board.board[row.to_i][column.to_i]
            
            if !chosen_spot.strip.empty?
                puts "Looks like that spot is taken. :( Try another one!"
                chosen_spot = " "
            else
                chosen_spot = player.letter
            end    
        end

        @board.board[row.to_i][column.to_i] = chosen_spot
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
        puts "You can type exit at any time to end the game."

        while no_winner? && @board.not_full?
            make_a_move(current_player)
            if current_player == @player1
                current_player = @player2
            else
                current_player = @player1
            end
        end
        
        restart_game
    end

    def restart_game
        @board.print_board

        play_again = get_valid_data("Play again? (Y/N): ", nil, ["Y", "N"])
        
        if play_again == "Y"
            @board.reset_board
            play_round
        else
            puts "See ya later!"
            exit!
        end
    end

    def no_winner?
        win_info = @board.check_for_win

        if win_info[1].nil?
            return true
        else
            if @player1.letter == win_info[1]
                puts "#{@player1.name} has won on #{win_info[0]}!"
            else
                puts "#{@player2.name} has won on #{win_info[0]}!"
            end
            
            return false
        end
    end
end

game = PlayGame.new()