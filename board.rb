# X | O | X
# ----------
# O | X | O
# ----------
# X | O | X


class Board

    def initialize
        @board = [[nil,nil,nil],
                [nil,nil,nil],
                [nil,nil,nil]]
    end

    def print_board
        p @board
    end

end

board = Board.new
board.print_board