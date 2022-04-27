class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        position = gets.chomp
        arr = position.split(" ")
        arr.map {|char| char.to_i}
    end

end