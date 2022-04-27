class Player

    attr_reader :mark
    def initialize (mark)
        @mark = mark 
    end

    def get_position
        puts "Please enter a position with row and column numbers as 'x, y': "
        begin 
            str = gets.chomp
            arr = str.split(" ")
            raise if arr.length != 2 
            raise if str.count(" ") > 1
            raise if (arr[0] != "0" && arr[0].to_i == 0) || (arr[1] != "0" && arr[1].to_i == 0)
        rescue
            puts "please enter 2 numbers separated by a space"
            retry
        end

        # #entered more than or less than 2 input
        # if arr.length != 2  
        #     raise ArgumentError.new"please enter two numbers"
        #     retry
        # end

        # #more than one space erorr
        # if str.count(" ") > 1
        #     raise ArgumentError.new"too many spaces"
        #     retry
        # end

        # #entered letters or characters
        # arr.each do |ele|
        #     if ele != "0" && ele.to_i == 0
        #         raise ArgumentError.new"please enter valid numbers"
        #         retry
        #     end
        # end


        position = arr.map {|ele| ele.to_i}
    end
end 