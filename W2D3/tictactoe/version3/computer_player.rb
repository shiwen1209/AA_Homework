class Computer

    attr_reader :mark
    def initialize (mark)
        @mark = mark 
    end

     def get_position(positions)
        pos = positions.sample
        puts "Computer chose position #{pos.join(" ")}"
        return pos 
     end 
end