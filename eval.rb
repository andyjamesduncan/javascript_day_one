end_flag = 1

puts "'q' will quit the program\n\n"

while end_flag == 1

	print " > "

	input = gets.chomp

	if input == 'q'
		end_flag = 0
	else
		eval input
	end

end

puts "Bye Bye!! :-)"