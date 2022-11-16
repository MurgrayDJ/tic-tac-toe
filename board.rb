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
        # @ways_to_win = {
        #     :row1 => ["00","01","02"],
        #     :row2 => ["10","11","12"],
        #     :row3 => ["20","21","22"],
        #     :col1 => ["00","10","20"],
        #     :col2 => ["01","11","21"], 
        #     :col3 => ["02","12","22"],
        #     :dia1 => ["00","11","22"],
        #     :dia2 => ["20","11","02"]}
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

    def check_for_win
        @board.each_with_index do |row, row_num|
            if row.uniq.length == 1
                return "row #{row_num}"
            end
        end

        @board.transpose.each_with_index do |column, column_num|
            if column.uniq.length == 1
                return "column #{column_num}"
            end
        end

        daigonal1 = [@board[0][0], @board[1][1], @board[2][2]]
        if daigonal1.uniq.length == 1
            return "diagonal down"
        end

        daigonal2 = [@board[2][0], @board[1][1], @board[0][2]]
        if daigonal2.uniq.length == 1
            return "diagonal up"
        end

        return "no winner"
    end

end

# board = Board.new
# board.print_board

# board.update_board(2,0,"X")
# board.print_board
# board.update_board(0,1,"O")
# board.print_board