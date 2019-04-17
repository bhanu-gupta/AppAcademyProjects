require_relative "../piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = " "
        @color = " "
    end

    def moves
    end


end


