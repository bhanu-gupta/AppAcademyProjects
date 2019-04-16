require_relative "employee"
require "byebug"
class Manager < Employee
    def initialize(name,title,salary,boss)
        super
        @employees = []
    end

    def bonus(mutiplier)
        # debugger
        return self.salary if !self.employees
        # debugger
        total_emp_sal = 0
        employees.each do |emp| 
            total_emp_sal += emp.salary 
            if emp.is_a?(Manager)
                # debugger
                total_emp_sal += emp.bonus(1)
                # debugger
            end
        end
        total_emp_sal * mutiplier
    end

    def add_employee(emp)
        employees << emp
    end
    private
    attr_writer :employees
    protected
    attr_reader :employees

end