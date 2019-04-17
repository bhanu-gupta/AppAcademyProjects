module Slideable
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    def moves
        self.move_dirs
    end
    protected
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]
    # HORIZONTAL_DIRS = [[0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
    # DIAGONAL_DIRS = [[-7, -7], [-6, -6], [-5, -5], [-4, -4], [-3, -3], [-2, -2], [-1, -1], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-7, 7], [-6, 6], [-5, 5], [-4, 4], [-3, 3], [-2, 2], [-1, 1], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
    def move_dirs
    end
    def grow_unblocked_moves_in_dir(dx,dy)
        possibilities_dir = []
        current_x, current_y = self.pos
        new_pos = current_x+dx, current_y+dy
        while board[new_pos] == NullPiece.instance
            possibilities_dir << new_pos
            current_x, current_y = new_pos
            new_pos = current_x+dx, current_y+dy
        end
        if self.color != board[new_pos].color
            possibilities_dir << new_pos
        end
        possibilities_dir
    end
    # def populate_horizontal_dir
    #     lr = []
    #     ud = []
    #     (-7..7).each do |el|
    #         lr << [el,el]
    #         ud << [el,-el]
    #     end
    #     return lr + ud
    # end
end