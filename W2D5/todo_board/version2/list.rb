require_relative "./item.rb"

class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        new_item = Item.new(title, deadline, description)
        @items<< new_item
        return true
    end

    def size
        @items.length
    end 

    def valid_index?(index)
        return false if index < 0 || index > self.size - 1
        return true
    end

    def [](index)
        return nil if !self.valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def swap(i1, i2)
        if self.valid_index?(i1) && self.valid_index?(i2)
            @items[i1], @items[i2] = @items[i2], @items[i1]
            return true 
        else
            return false
        end
    end

    def print
        puts "-"*44
        puts "#{@label}".center(44)
        puts "-"*44
        puts "Index ".ljust(6) + "| Item ".ljust(20) + "| Deadline".ljust(12) + "| Complete".ljust(6)
        puts "-"*44
        @items.each_with_index do |item, i|
            puts "#{i} ".ljust(6) + "| #{item.title} ".ljust(20) + "| #{item.deadline}".ljust(12) + "#{item.complete}".ljust(6)
        end 
        puts "-"*44
            
    end 

    def print_full_item(index)
        puts "-"*44
        puts "#{self[index].title}".ljust(20) + "#{self[index].deadline}".ljust(12) + "#{self[index].complete}".rjust(12)
        puts "#{self[index].description}"
        puts "-"*44

    end

    def print_priority
        print_full_item(0)
    
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        while amount > 0 && index > 0
            swap(index, index-1)
            amount -= 1
            index -= 1
        end
        return true
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        while amount > 0 && index < self.size-1
            swap(index, index+1)
            amount -= 1
            index += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by!{|ele| ele.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end


    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
        return true
    end

    def purge
        new_item = []
        @items.each do |item|
            if !item.complete
                new_item<< item
            end
        end

        @items = new_item

    end
    


end