require_relative "../piece"
require_relative "slideable"
require_relative "null_piece"
class Queen < Piece
    include Slideable

    protected
    def move_dirs
        possibilities = []
        diagonal_dirs.each do |dir|
            x,y = dir
            possibilities += grow_unblocked_moves_in_dir(x,y)
        end
        horizontal_dirs.each do |dir|
            x,y = dir
            possibilities += grow_unblocked_moves_in_dir(x,y)
        end
        possibilities
    end
end