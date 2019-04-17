require_relative "../piece"
require_relative "slideable"
require_relative "null_piece"

class Rook < Piece
    include Slideable


    protected
    def move_dirs
        possibilities = []
        horizontal_dirs.each do |dir|
            x,y = dir
            possibilities += grow_unblocked_moves_in_dir(x,y)
        end
        possibilities
    end

end