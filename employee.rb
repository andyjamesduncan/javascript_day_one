class Payroll
	def update( changed_employee )
		puts("\nPayroll")
		puts("=======")
		puts("Cut a new check for #{changed_employee.name}!")
 		puts("His salary is now #{changed_employee.salary}!\n")
 	end
end

class Manager
	def update( changed_employee )
		puts("\nManager")
		puts("=======")
		puts("I am a manager")
 		puts("I am observing #{changed_employee.name}!")
 		puts("I know that his salary is now #{changed_employee.salary}!\n")
 	end
end

class FunkyMonkeyNuts
	def update( changed_employee )
		puts("\nFunkyMonkeyNuts")
		puts("==============")
		puts("Funky Monkey Nuts for #{changed_employee.name}!\n")
 	end
end

class Employee
 	attr_reader :name, :title
 	attr_reader :salary
 
 	def initialize( name, title, salary)
 		@name = name
 		@title = title
 		@salary = salary
 		
 		@observers = []
 	end
 
 	def salary=(new_salary)
		@salary = new_salary
		
		update_observers
 	end

 	def add_observer (observer)

 		@observers << observer

 	end

 	def update_observers

 		@observers.each do |observer|

 			observer.update(self)

 		end

 	end
end

# Main

fred = Employee.new('Fred', 'Crane Operator', 30000)

fred.add_observer(Payroll.new)
fred.add_observer(Manager.new)
fred.add_observer(FunkyMonkeyNuts.new)

fred.salary =(35000);

puts
