require_relative "board"
require_relative "human_player"

class Game

    def initialize(n, *marks)
        @n = n
        @marks = marks
        @players = marks.map {|mark| Player.new(mark)}
        @current_player = @players[0]
        @board = Board.new(@n)
    end

    def switch_on
        if@current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
        return @current_player
    end

    def switch_turn
        @current_player = @players.rotate![0]
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
                self.switch_turn
            end
        end 
        puts "It's a draw"
        return
    end

    def reset
        @board = Board.new
    end



end