end_flag = "n"

puts "'q' will quit the program\n\n"

while end_flag == "n"

	print " > "

	input = gets.chomp

	if input == 'q'
		end_flag = "monky"
	else
		eval input
	end

end

puts "Bye Bye!! :-)"