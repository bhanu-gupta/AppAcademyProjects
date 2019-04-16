require "colorize"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    attr_reader :board, :cursor

    def render
        puts "  0 1 2 3 4 5 6 7"
        (0...board.rows.length).each do |row|
            print row.to_s+" "
            (0...board.rows.length).each do |col|
                position = [row,col]
                if position == cursor.cursor_pos
                    board[position].red
                end
                if board[position]
                    print board[position].color + " "
                    
                else
                    print "  "
                end
            end
            puts
        end
    end
end