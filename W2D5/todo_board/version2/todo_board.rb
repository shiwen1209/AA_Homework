require_relative "./item.rb"
require_relative "./list.rb"

class TodoBoard

    def initialize
        @hash = {}
    end

    def add_list(label)
        new_list = List.new(label)
        @hash[label] = new_list
    end

    def get_command
        print "\nEnter a command: "
        cmd, list_label, *args = gets.chomp.split(" ")
        list = @hash[list_label] if list_label != nil && @hash[list_label] != nil
        

        case cmd
        when "mklist"
            self.add_list(list_label)
        when "ls"
            @hash.each do |k, v|
                puts k
            end
        when "showall"
            @hash.each do |k, v|
                v.print
            end
        when "mktodo"
            list.add_item(*args)
        when "quit"
            return false
        when "up"
            args1 = args.map {|str| str.to_i}
            list.up(*args1)
        when "down"
            args1 = args.map {|str| str.to_i}
            list.down(*args1)
        when "swap"
            args1 = args.map {|str| str.to_i}
            list.swap(*args1)
        when "sort"
            list.sort_by_date!
        when "priority"
            list.print_priority
        when "print"
            if args.length == 0
                list.print
            else
                args[0] = args[0].to_i
                list.print_full_item(*args)
            end
        when "toggle"
            args[0] = args[0].to_i
            list.toggle_item(*args)
        when "rm"
            args[0] = args[0].to_i
            list.remove_item(*args)
        when "purge"
            list.purge
        else
            puts "Sorry, that command is not recognized."
        end
        return true
    end

    def run 
        while self.get_command
        end
    end 
end