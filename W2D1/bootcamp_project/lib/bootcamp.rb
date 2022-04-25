class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(string)
        @teachers<< string
    end

    def enroll(string)
        if @students.length < @student_capacity
            @students<< string
            return true
        else
            return false
        end
    end

    def enrolled?(string)
        students_lowercase = @students.map {|s| s.downcase}
        students_lowercase.include?(string.downcase)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(string, number)
        if self.enrolled?(string) # why can we use self here, since we have two input variables for enrolled?
            @grades[string]<< number
            return true
        else
            return false 
        end
    end

    def num_grades(string)
        @grades[string].length
    end

    def average_grade(string)
        return nil if !self.enrolled?(string) || @grades[string].empty?
        @grades[string].sum / @grades[string].length
    end
  
end
