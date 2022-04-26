require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []

    end

    def valid_title?(title)
        @salaries.key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        unless self.valid_title?(title)
            raise ArgumentError.new"title does not exist"
        end

        new_hire = Employee.new(name, title)
        @employees<< new_hire

    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if self.funding >= salary
            employee.pay(salary)
            @funding = @funding - salary
        else
            raise ArgumentError.new"There's no more funding"
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0 
        @employees.each do |employee|
            sum = sum + @salaries[employee.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding = @funding + startup.funding
        startup.salaries.each do |k, v|
            if !@salaries.key?(k)
                @salaries[k] = v
            end
        end
        @employees = @employees + startup.employees
        startup.close
    end

end
