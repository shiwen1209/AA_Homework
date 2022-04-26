require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, rooms)
        @name = name
        @rooms = Hash[rooms.map{|k, v| [k, Room.new(v)]}]
    end

    def name
        name_arr = @name.split
        capitalized = name_arr.map {|word| word.capitalize}
        capitalized.join(" ")
    end

    def room_exists?(name)
        @rooms.key?(name)
    end
  
    def check_in(person, room)
        if !self.room_exists?(room)
            puts "sorry, room does not exist"
        elsif self.rooms[room].add_occupant(person)
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end

    def has_vacancy?
        rooms.any? {|k, v| !v.full?}
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k}: #{v.available_space}\n"
        end
    end

end
