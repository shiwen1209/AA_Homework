class Board

    attr_reader :size
    def initialize(n)
        @n = n
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n*n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, val)
        @grid[arr[0]][arr[1]] = val
    end

    def num_ships
        count = 0
        @grid.each do |subarr|
            count = count + subarr.count(:S)
        end
        return count
    end

    def attack(arr)
        val = self[arr]
        if val == :S
            self[arr] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[arr] = :X
            return false
        end
    end

    def place_random_ships
        p = @size / 4
        while p> 0
            i = rand(0..@n-1)
            j = rand(0..@n-1)
            if @grid[i][j] != :S
                @grid[i][j] = :S
                p -= 1
            end
        end
    end

    def hidden_ships_grid
        new_grid =  @grid.map{|subarr| subarr.map{|ele| ele == :S ? :N : ele}}
    end

    def self.print_grid(grid)
        grid.each do |subarr|
            line = subarr.join(" ")
            puts "#{line}"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
  
end
