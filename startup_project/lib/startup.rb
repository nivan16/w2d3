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
            return @salaries.has_key?(title)

        end

        def >(other_funding) #Syntactic Sugar Comparisons!!!!
            return self.funding > other_funding.funding
        end

        def hire(employ_name, title)
            if valid_title?(title)
                employee_name = Employee.new(employ_name, title)
                @employees << employee_name
            else
                raise "invalid title"
            end
        end
        
        def size
            return @employees.length
        end

        def pay_employee(emp)
            if funding >= @salaries[emp.title]
                emp.pay(@salaries[emp.title])
                @funding -= @salaries[emp.title]
            else
                raise "Not enough funding"
            end
        end

        def payday
            @employees.map! { |emp| pay_employee(emp) }
        end

        def average_salary
            sum = 0
            @employees.each {|emp| sum += @salaries[emp.title] }
            return sum / (@employees.length*1.0)

        end

        def close
            @employees = []
            @funding = 0
        end

        def acquire(srtup)
            @funding += srtup.funding
            srtup.salaries.each {|title, salary| @salaries[title] = salary if !@salaries.keys.include?(title) }
            srtup.employees.each {|emp| self.employees << emp}
            srtup.close
        end















end
