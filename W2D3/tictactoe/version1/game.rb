require_relative "board"
require_relative "human_player"

class Game

    def initialize(mark1, mark2)
        @player1 = Player.new(mark1)
        @player2 = Player.new(mark2)
        @board = Board.new
        @current_player = @player1
    end

    def switch_on
        if@current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
        return @current_player
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(position, mark)
            if @board.win?(mark)
                puts "Victory!!! #{mark} has won!"
                return 
            else
                self.switch_on
            end
        end 
        puts "It's a draw"
        return
    end

    def reset
        @board = Board.new
    end

end