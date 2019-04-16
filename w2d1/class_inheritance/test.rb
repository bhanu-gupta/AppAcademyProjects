require_relative "manager"


# p temp_emp = Employee.new("test","test_job","0",nil)


ned = Manager.new("Ned", "Founder",1000000, nil)
darren = Manager.new("Darren", "Manager",78000, ned)
# manager1.add_employee(manager2)
shawan = Employee.new("Shawan", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
# manager2.add_employee(emp1)
# manager2.add_employee(emp2)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000