require_relative "pieces/null_piece"
require "singleton"
require_relative "my_errors"

class Board
    include Singleton
    def initialize()
        @sentinel = NullPiece.instance
        @rows = Array.new(8) {Array.new(8,  nil)}
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
            if valid_pos?(end_pos)
                self[end_pos] = self[start_pos]
                self[start_pos] = nil
            else
                raise InvalidPositionError.new("Invalid End Position")
            end
        else
            raise InvalidPositionError.new("Invalid Start Position")
        end
        
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

    def display_board
        puts "  0 1 2 3 4 5 6 7"
        (0...rows.length).each do |row|
            print row.to_s+" "
            (0...rows.length).each do |col|
                position = [row,col]
                
                if self[position]
                    print self[position].color + " "
                    
                else
                    print "  "
                end
            end
            puts
        end

    end

    attr_accessor :rows

    private
    attr_accessor :sentinel

    def generate_board
        (0...rows.length).each do |row|
            (0...rows.length).each do |col|
                if row < 2
                    position = [row,col]
                    self[position] = Piece.new("w", self, position)
                end
                if row > 5
                    position = [row,col]
                    self[position] = Piece.new("b", self, position)
                end
            end
        end
    end
end

b = Board.instance
b.display_board