require_relative "pieces/pawn"
require_relative "pieces/rook"
require_relative "pieces/queen"
require_relative "pieces/king"
require_relative "pieces/bishop"
require_relative "pieces/knight"

require_relative "pieces/null_piece"
require "singleton"
require_relative "my_errors"
require_relative "display"


class Board
    include Singleton
    def initialize()
        @sentinel = NullPiece.instance
        @rows = Array.new(8) {Array.new(8,  sentinel)}
        generate_board
    end
    def [] (pos)
        row, col = pos
        rows[row][col]
    end

    def []= (pos,val)
        row, col = pos
        rows[row][col] = val
    end

    # piece.board.move()
    def move_piece(start_pos,end_pos)
        if valid_pos?(start_pos)
            if valid_pos?(end_pos) && valid_move?(start_pos, end_pos)
                self[end_pos] = self[start_pos]
                self[start_pos] = sentinel
            else
                raise InvalidPositionError.new("Invalid End Position")
            end
        else
            raise InvalidPositionError.new("Invalid Start Position")
        end
        
    end

    def valid_move?(start_pos, end_pos)
        possible_moves = self[start_pos].moves
        possible_moves.include?(end_pos)
    end


    def valid_pos?(pos)
        x,y = pos
        return false if x <0 || x > 7
        return false if y <0 || y > 7
        true
    end

    def add_piece(piecce,pos)
    end

    def checkmate?(color)
    end

    def  in_check?(color)
    end
    
    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color,start_pos,end_pos)
    end

    attr_accessor :rows

    private
    attr_accessor :sentinel

    def generate_board
        (0...rows.length).each do |row|
            (0...rows.length).each do |col|
                position = [row,col]  
                if row < 2
                    temp_color = "w"
                elsif row > 5
                    temp_color = "b"
                end
                if row == 1 || row == 6
                    self[position] = Pawn.new("p",self, position, temp_color)
                elsif row == 0 || row == 7
                    if col == 0 || col == 7
                         self[position] = Rook.new("r",self, position, temp_color)
                    elsif col == 1 || col == 6
                        self[position] = Knight.new("k",self, position, temp_color)
                    elsif col == 2 || col == 5
                        self[position] = Bishop.new("b",self, position, temp_color)
                    elsif col == 3
                        self[position] = King.new("K",self, position, temp_color)
                    elsif col == 4
                        self[position] = Queen.new("Q",self, position, temp_color)
                    end
                end             
            end
        end
    end
end

b = Board.instance
dp = Display.new(b)
# while true
#     begin
#         dp.render

#         # b[cursor_pos].grow_moves(cursor_pos[0],c_p[1])

#     rescue InvalidPositionError => e
#         puts e.message
#         retry
#     end
# end