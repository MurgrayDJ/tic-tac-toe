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
        setup_board
    end

    def reset_board
        setup_board
    end

    private

    def setup_board
        @board = [[" "," "," "],
                [" "," "," "],
                [" "," "," "]]
    end

    public

    def print_board
        puts "\n          Columns"
        puts "         0   1   2"
        puts "       -------------"
        @board.each_with_index do |row, row_num|
            if row_num == 1 
                puts "Rows #{row_num} | #{row[0]} | #{row[1]} | #{row[2]} |"
            else
                puts "     #{row_num} | #{row[0]} | #{row[1]} | #{row[2]} |"
            end
            puts "       -------------"
        end
        puts
    end

    def not_full?
        @board.each do |row|
            row.each do |spot|
                if spot.strip.empty?
                    return true
                end
            end
        end
        puts "Looks like a tie! :O Game over!"
        return false
    end

    def check_for_win
        @board.each_with_index do |row, row_num|
            unless row[0].strip.empty?
                condensed = row.uniq
                if condensed.length == 1
                    return ["row #{row_num}", condensed[0]]
                end
            end
        end

        @board.transpose.each_with_index do |column, column_num|
            unless column[0].strip.empty?
                condensed = column.uniq
                if condensed.length == 1
                    return ["column #{column_num}", condensed[0]]
                end
            end
        end

        daigonal1 = [@board[0][0], @board[1][1], @board[2][2]]
        unless daigonal1[0].strip.empty?
            condensed = daigonal1.uniq
            if condensed.length == 1
                return ["diagonal down", condensed[0]]
            end
        end

        daigonal2 = [@board[2][0], @board[1][1], @board[0][2]]
        unless daigonal2[0].strip.empty?
            condensed = daigonal2.uniq
            if condensed.length == 1
                return ["diagonal up", condensed[0]]
            end
        end

        return ["no winner", nil]
    end

end