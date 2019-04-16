class Employee

    def initialize(name,title,salary,boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        if boss
            add_to_boss
        end
    end

    def bonus(mutiplier)
        bonus = (salary) * mutiplier
    end

    def add_to_boss
        @boss.add_employee(self)
    end

    protected
    attr_reader :name, :title, :salary, :boss 

    private
    attr_writer :name, :title, :salary, :boss 

end