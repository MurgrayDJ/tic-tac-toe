require_relative '../lib/board.rb'

RSpec.describe Board do
  board_class = described_class.new 
  
  describe '#full?' do
    context 'board is empty' do
      it 'shows that board is not full' do
        expect(board_class.full?).to be(false)
      end
    end

    context 'board is partially filled' do
      it 'shows that board is not full' do
        board_class.board = [["X","O","X"],
        ["O"," "," "],
        [" "," "," "]]
        expect(board_class.full?).to be(false)
      end
    end

    context 'board is full' do
      it 'shows that board is full' do
        board_class.board = [["X","O","X"],
        ["O","X","O"],
        ["X","O","X"]]
        expect(board_class.full?).to be(true)
      end
    end
  end

end
