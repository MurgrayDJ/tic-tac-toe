# -------------
# | X | O | X |
# -------------
# | O | X | O |
# -------------
# | X | O | X |
# -------------

class Board
    attr_accessor :board

    def initialize
        @board = [[" "," "," "],
                [" "," "," "],
                [" "," "," "]]
    end

    def print_board
        # p @board
        puts "\n-------------"
        @board.each do |row|
            puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
            puts "-------------"
        end
    end

    def update_board(row, column, letter)
        @board[row][column] = letter
    end

end

# board = Board.new
# board.print_board

# board.update_board(2,0,"X")
# board.print_board
# board.update_board(0,1,"O")
# board.print_board