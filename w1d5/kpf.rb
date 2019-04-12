require_relative "skeleton/lib/00_tree_node"

class KnightPathFinder
    def initialize(start_pos)
        @start_pos = start_pos
        self.build_move_tree
    end

    def root_node
        @start_node = PolyTreeNode.new(@start_pos)
    end

    def build_move_tree
        self.root_node
    end

    def new_move_positions
    end

    def self.valid_moves(pos)
        left = pos.first
        right = pos.last
        valid_pos = []

        (left-2..left+2).each do |row_idx|
            (right-2..right+2).each do |col_idx|
                unless row_idx > 7 || row_idx < 0 || col_idx > 7 || col_idx < 0
                    if ((left - row_idx).abs == 1 && (right - col_idx).abs == 2) || 
                        ((left - row_idx).abs == 2 && (right - col_idx).abs == 1)
                        valid_pos << [row_idx, col_idx]
                    end
                end
            end
        end
        valid_pos                             
    end

end