require_relative "../piece"
require_relative "slideable"
class Bishop < Piece
    include Slideable
    protected
    def move_dirs
        possibilities = []
        diagonal_dirs.each do |dir|
            x,y = dir
            possibilities += grow_unblocked_moves_in_dir(x,y)
        end
        possibilities
    end
end