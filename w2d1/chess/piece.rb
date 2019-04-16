# require_relative "board"

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
    def to_s
        puts "#{color} piece at pos #{pos}"
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
        @pos = val
    end

    def symbol
    end
    attr_reader :color
    protected
    attr_reader :pos
    private
    def move_into_check?(end_pos)
    end
end