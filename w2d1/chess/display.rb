require "colorize"
require_relative "cursor"
require_relative "pieces/null_piece"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    attr_reader :board, :cursor

    def render

        system ("clear")
        puts "  0 1 2 3 4 5 6 7"
        (0...board.rows.length).each do |row|
            print row.to_s+" "
            (0...board.rows.length).each do |col|
                position = [row,col]
                if position == cursor.cursor_pos
                    print board[position].symbol.colorize(:red).colorize( :background => :black) + " ".colorize( :background => :light_blue)
                else 
                    board[position].print_s
                    print " ".colorize( :background => :light_blue)
                
                end
            end
            puts
        end
        cursor.get_input
    end
end