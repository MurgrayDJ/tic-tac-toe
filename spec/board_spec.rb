require_relative '../lib/board.rb'

RSpec.describe Board do
  before { @board_class = described_class.new }
  
  describe '#full?' do
    context 'board is empty' do
      it 'shows that board is not full' do
        expect(@board_class.full?).to be(false)
      end
    end

    context 'board is partially filled' do
      it 'shows that board is not full' do
        @board_class.board = 
        [["X","O","X"],
        ["O"," "," "],
        [" "," "," "]]
        expect(@board_class.full?).to be(false)
      end
    end

    context 'board is full' do
      it 'shows that board is full' do
        @board_class.board = 
        [["X","O","X"],
        ["O","X","O"],
        ["X","O","X"]]
        expect(@board_class.full?).to be(true)
      end
    end
  end

  describe '#check_for_win' do
    context 'board is empty' do
      it 'shows that there is no winner' do
        expect(@board_class.check_for_win).to eq(["no winner", nil])
      end
    end

    context 'board is full with no winner' do
      it 'shows that there is no winner' do
        @board_class.board = 
        [["X","O","X"],
        ["O","O","X"],
        ["X","X","O"]]
        expect(@board_class.check_for_win).to eq(["no winner", nil])
      end
    end

    context 'top row win' do
      it 'returns that X won on row 0' do
        @board_class.board =
        [["X","X","X"],
        ["O","O","X"],
        ["O","X","O"]]
        expect(@board_class.check_for_win).to eq(["row 0", 'X'])
      end
    end

    context 'middle row win' do
      it 'returns that O won on row 1' do
        @board_class.board =
        [["X","O","X"],
        ["O","O","O"],
        ["X","X","O"]]
        expect(@board_class.check_for_win).to eq(["row 1", 'O'])
      end
    end

    context 'bottom row win' do
      it 'returns that M won on row 2' do
        @board_class.board =
        [["J","M","J"],
        ["J","J","M"],
        ["M","M","M"]]
        expect(@board_class.check_for_win).to eq(["row 2", 'M'])
      end
    end

    context 'diagonal down win' do
      it 'returns that K won on diagonal down' do
        @board_class.board =
        [["K","I","I"],
        ["I","K","K"],
        ["K","I","K"]]
        expect(@board_class.check_for_win).to eq(["diagonal down", 'K'])
      end
    end

    context 'diagonal up win' do
      it 'returns that X won on diagonal up' do
        @board_class.board =
        [["O","O","X"],
        ["X","X","O"],
        ["X","O","O"]]
        expect(@board_class.check_for_win).to eq(["diagonal up", 'X'])
      end
    end
  end
end
