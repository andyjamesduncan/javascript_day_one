class Car

	attr_accessor :x_posn, :y_posn, :last_axis_arr, :last_movement_arr

	def initialize

		@x_posn = 0
		@y_posn = 0
		@last_axis_arr = []
		@last_movement_arr = []

	end

	def current_posn

		"Car posn --> X: " + @x_posn.to_s + ", Y: " + @y_posn.to_s

	end

	def execute(axis, movement)

		@last_axis_arr.push(axis)
		@last_movement_arr.push(movement)

		move(axis, movement)

	end

	def undo()

		if @last_axis_arr.size > 0

			move(@last_axis_arr.pop, - @last_movement_arr.pop)
		else

			puts "Cannot undo any more"
		end
			

	end

	def move(axis, movement)

		if axis == "x"
			@x_posn += movement
		else
			@y_posn += movement
		end

	end

end

my_car = Car.new

puts my_car.current_posn

keep_going_flag = 1

while keep_going_flag == 1

	if my_car.last_axis_arr.size > 0
		print my_car.current_posn + 
			" | Left, Right, Up, Down, GO BACK, or Quit? (l/r/u/d/g/q) ?> "
	else
		print my_car.current_posn + 
			" | Left, Right, Up, Down, or Quit? (l/r/u/d/q) ?> "
	end

	input = gets.chomp

	if input == "l"
		my_car.execute("x", -1)
	elsif input == "r"
		my_car.execute("x", 1)
	elsif input == "u"
		my_car.execute("y", 1)
	elsif input == "d"
		my_car.execute("y", -1)
	elsif input == "g"
		my_car.undo
	elsif input == "q"
		keep_going_flag = 0
	else
		puts "I do not understand your input of >" + input.to_s + "<"
	end

	my_car.current_posn
end






