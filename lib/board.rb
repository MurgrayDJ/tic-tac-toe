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

    def full?
        @board.each do |row|
            row.each do |spot|
                if spot.strip.empty?
                    return false
                end
            end
        end
        puts "Looks like a tie! :O Game over!"
        return true
    end

    def check_row_or_column(the_board, row_type)
        the_board.each_with_index do |row, row_num|
            condensed = row.uniq
            if condensed.length == 1 && condensed[0] != " "
                return ["#{row_type} #{row_num}", condensed[0]]
            end
        end   
        nil 
    end

    def check_diagonal(diagonal, diagonal_type)
        condensed = diagonal.uniq
        if condensed.length == 1 && condensed[0] != " "
            return [diagonal_type, condensed[0]]
        end
        nil
    end

    def check_for_win
        win_info = ["no winner", nil]
        win_info = check_row_or_column(@board, 'row') || win_info
        win_info = check_row_or_column(@board.transpose, 'column') || win_info

        daigonal_down = [@board[0][0], @board[1][1], @board[2][2]]
        win_info = check_diagonal(daigonal_down, 'diagonal down') || win_info

        daigonal_up = [@board[2][0], @board[1][1], @board[0][2]]
        win_info = check_diagonal(daigonal_up, 'diagonal up') || win_info
        
        return win_info 
    end

end