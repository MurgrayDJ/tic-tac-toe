# -------------
# | X | O | X |
# -------------
# | O | X | O |
# -------------
# | X | O | X |
# -------------

class Board

    def initialize
        @board = [[" "," "," "],
                [" "," "," "],
                [" "," "," "]]
    end

    def print_board
        # p @board
        puts "-------------"
        @board.each do |row|
            puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
            puts "-------------"
        end
    end

end

board = Board.new
board.print_board