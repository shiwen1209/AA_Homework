require_relative "code"

class Mastermind
    def initialize(len)
        @len = len
        @secret_code = Code.random(@len)
    end

    def print_matches(code)
        puts "Exect match: #{code.num_exact_matches(@secret_code)}"
        puts "Near match #{code.num_near_matches(@secret_code)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        str = gets.chomp
        new_code = Code.from_string(str)
        print_matches(new_code)
        new_code == @secret_code
    end

end
