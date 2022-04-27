class Board

    attr_accessor :grid
    def initialize(n)
        @n = n
        @grid = Array.new(@n) {Array.new(@n, "_")}
    end

    def valid?(position)
        rows = (0...@n).to_a
        columns = (0...@n).to_a
        rows.include?(position[0]) && columns.include?(position[1])
    end

    def empty?(position)
        i = position[0]
        j = position[1]
        @grid[i][j] == "_"
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise ArgumentError.new"Not a valid position"
        elsif !empty?(position)
            raise ArgumentError.new"Position is filled"
        else
            i = position[0]
            j = position[1]
            @grid[i][j]= mark

        end
    end

    def print
        @grid.each do |subarr|
            line = subarr.join(" ")
            puts line
        end
    end

    def win_row?(mark)
        @grid.any? {|subarr| subarr.all?{|ele| ele == mark}}
    end

    def win_col?(mark)
        @grid[0].each_with_index do |ele, i|
            column = @grid.map {|subarr| subarr[i]}
            if column.all? {|ele| ele == mark}
                return true
            end
        end
        return false 
    end

    def win_diagonal?(mark) 
        i = 0
        j = 0
        diagonal1 = []
        while i< @grid.length
            diagonal1<< @grid[i][j]
            i = i + 1
            j = j + 1
        end
        return true if diagonal1.all? {|ele| ele == mark}

        i = 0
        j = @grid.length - 1
        diagonal2 = []
        while i< @grid.length
            diagonal2<< @grid[i][j]
            i = i + 1
            j = j - 1
        end
        return true if diagonal2.all? {|ele| ele == mark}
        
        return false 
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |subarr|
            if subarr.any? {|ele| ele == "_"}
                return true
            end
        end
        return false
    end
end