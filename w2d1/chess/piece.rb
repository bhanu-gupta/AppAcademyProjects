require "colorize"

class Piece
    def initialize(symbol, board, pos, color)
        @symbol = symbol
        @board = board
        @pos = pos
        @color = color
    end
    def print_s
        # "{&:b[pos]}" b[pos].to_s + " "
        # print @symbol
        if color == "w"
            print @symbol.colorize(:white ).colorize( :background => :light_blue)
        else
            print @symbol.colorize(:black ).colorize( :background => :light_blue)
        end
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
        @pos = val
    end


    attr_reader :color, :board , :symbol
    protected
    attr_reader :pos
    private
    def move_into_check?(end_pos)
    end
end