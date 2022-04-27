class Player

    attr_reader :mark
    def initialize (mark)
        @mark = mark 
    end

    def get_position(positions)
        puts "Please enter a position with row and column numbers as 'x, y': "
        begin 
            str = gets.chomp
            arr = str.split(" ")
            position = arr.map {|ele| ele.to_i}
            raise if arr.length != 2 
            raise if str.count(" ") > 1
            raise if (arr[0] != "0" && arr[0].to_i == 0) || (arr[1] != "0" && arr[1].to_i == 0)
            raise if !positions.include?(position)
        rescue
            puts "please enter a legal position"
            retry
        end
        
        return position

    end
end 