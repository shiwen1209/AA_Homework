class Item

    def self.valid_date?(date)
        arr = date.split("-")
        arr1 = arr.map {|ele| ele.to_i}
        year, month, day = arr1
        if (1000..2022).include?(year) && (1..12).include?(month) && (1..31).include?(day)
            return true
        else
            return false
        end
    end

    attr_accessor :title, :deadline, :description
    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "deadline is not valid"
        end
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(deadline)
            raise "deadline is not valid"
        end
    end

end