class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity

        @teachers = []
        @students = []
        @grades = Hash.new{|h, k| h[k] = []}
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
    
    def hire(teach)
        @teachers << teach
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end



#_____________________________PART 2__________________________________#
    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        return nil if !self.enrolled?(student) || @grades[student].length < 1
        return (@grades[student].sum) / self.num_grades(student)        
    end







end