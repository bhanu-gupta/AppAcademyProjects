require_relative "../piece"
require_relative "stepable"
class Knight < Piece
    include Stepable

    def knight_dir
        KNIGHT_DIR
    end

    protected

    def move_diffs
        possibilities = []
        knight_dir.each do |dir|
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
    KNIGHT_DIR = [[1,2],[1,-2],[-1,2],[-1,-2],
    [2,1],[2,-1],[-2,1],[-2,-1]]
end