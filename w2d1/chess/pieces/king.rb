require_relative "../piece"
require_relative "stepable"
class King < Piece
    include Stepable
   
    def king_dir
        KING_DIR
    end

    protected

    def move_diffs
        possibilities = []
        king_dir.each do |dir|
            x,y = dir
            curr_x, curr_y  = @pos
            new_pos = [curr_x+x,curr_y+y]
            if board.valid_pos?(new_pos) &&
                (board[new_pos] == NullPiece.instance || 
                self.color != board[new_pos].color )
                possibilities << new_pos
            end
        end
        possibilities
    end

    private
    KING_DIR = [[-1,0], [-1,-1], [-1,1], [0,-1], [0,1], [1,0],[1,-1],[1,1]]
end