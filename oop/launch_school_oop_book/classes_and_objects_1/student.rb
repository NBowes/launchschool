class Student
    def initialize(name,grade)
        @name = name
        @grade = grade
    end

    def better_grade_than?(name)
        grade > name.grade
    end

    protected 

    def grade
        @grade
    end
end

nate = Student.new('nate', 92)
dustin = Student.new('dustin', 91)
puts "Well done!" if nate.better_grade_than?(dustin)
