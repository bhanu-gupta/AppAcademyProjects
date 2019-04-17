require_relative "../piece"
require "byebug"
class Pawn < Piece

    def initialize(symbol, board, pos, color)
        super
        @start_pos = pos
    end



    def move_dirs
    end

    def moves
        forward_steps
    end

    private
    FORWARD_DIR = [[1,0], [2,0]]
    def at_start_row?
        pos == @start_pos
    end

    def forward_dir
        FORWARD_DIR
    end

    def forward_steps
        possibilities = []
        x,y = pos
        arr = forward_dir
        if !at_start_row?
            arr = forward_dir.take(1)
        end
        if self.color == "b"
            arr = arr.map {|el| [el[0]*-1,el[1]]}
            # debugger
        end
        arr.each do |el|
            new_pos = [x+el[0],y+el[1]]
            # debugger
            if board.valid_pos?(new_pos) && board[new_pos] == NullPiece.instance
                possibilities << new_pos
            end
        end
        # if self.at_start_row?
        #     new_pos = x+2,y
        #     if board.valid_pos?(new_pos) && board[new_pos] == NullPiece.instance
        #         possibilities << new_pos
        #     end
        # end
        # new_pos = x+1,y
        # if board.valid_pos?(new_pos) && board[new_pos] == NullPiece.instance
        #     possibilities << new_pos
        # end
        possibilities
    end

    def sid_attacks
    end

end