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
    end

end