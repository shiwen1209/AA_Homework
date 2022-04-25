# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum.to_f / self.length
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        if self.length.odd?
            return sorted[sorted.length/2]
        else
            return (sorted[(sorted.length/2) - 1] + sorted[sorted.length/2])/2.0
        end
    end

    def counts
       hash = Hash.new(0)
       self.each do |ele|
        hash[ele] += 1
       end
       return hash
    end

    def my_count(num)
        self.counts[num]
    end

    def my_index(num)
        return nil if !self.include?(num)
        self.each_with_index do |ele, i|
            if ele == num
                return i
            end
        end
    end

    def my_uniq
        uniq = []
        self.each do |ele|
            if !uniq.include?(ele)
                uniq<< ele
            end
        end
        return uniq
    end

    def my_transpose
        transposed = []
        i = 0 
        while i< self.length
            subarr = []
            j = 0
            while j< self.length
                subarr<< self[j][i]
                j += 1
            end
            transposed<< subarr
            i += 1
        end
        return transposed
    end
    
    

end
