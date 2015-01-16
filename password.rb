class MenuOptions

	attr_accessor :valid_options, :input_text

	def initialize(input_text)

		@input_text = input_text

		@valid_options = {	"c" => {TextCount => menu_text("Count the letters in")}, 
							"r" => {TextReverse => menu_text("Reverse the text of")},
							"l" => {TextLower => menu_text("Lower the case of")},
							"b" => {Banana => menu_text("I will print Banana")}, 
							"u" => {TextUpper => menu_text("Uppercase the text of")} }

	end

	def menu_text(first_part)

		first_part + " '" + @input_text + "'"

	end

	def chooser(input_letter)

		if @valid_options[input_letter]
			executor( @valid_options[input_letter].keys[0] )
		else
			puts "\n*** Invalid menu option: '" + input_letter + "' ***\n\n"
		end

	end

	def executor(the_class)

		output_text = the_class.new.executor(@input_text)

		puts "\nInput  : " + @input_text
		puts "Output : " + output_text + "\n\n"
	end
end

class Banana
	def executor(input)
		"Banana! :-)"
	end
end

class TextCount
	def executor(input)
		input.length.to_s
	end
end

class TextReverse
	def executor(input)
		input.reverse
	end
end

class TextLower
	def executor(input)
		input.downcase
	end
end

class TextUpper
	def executor(input)
		input.upcase
	end
end

class AllUsers

	attr_accessor :all_users

	def initialize

		@all_users = []

	end

	def add_user(user_obj)

		@all_users.push(user_obj)

	end

end

class ConfirmUser

	attr_accessor :all_users

	def initialize(all_users)

		@all_users = all_users

	end

	def confirm_user

		print "Please enter user > "

		user = gets.chomp

		valid_user = 0
		valid_passwd = 0

		matching_user_obj = 0

		all_users.all_users.each do |user_obj|

			if user_obj.user == user
				valid_user = 1
				matching_user_obj = user_obj

				puts "User " + user.to_s + "exists"
			end
		end

		if valid_user == 1

			print "Please enter passwd > "

			passwd = gets.chomp

			if matching_user_obj.passwd == passwd
				valid_passwd = 1
				puts "Passwd " + passwd.to_s + " correct"
			end
		end

		if ((valid_user == 1) && (valid_passwd == 1))
			puts "User is confirmed"
			return 1
		else
			puts "Die Evil Spammer!"
			return 0
		end
	end
end

class User

	attr_accessor :user, :passwd

	def initialize

		@user = ""
		@passwd = ""

	end

	def menu_options

		menu_options = MenuOptions.new(@user)

		puts "\nMenu Options are: \n\n"

		menu_options.valid_options.keys.each do |key| 
			menu_options.valid_options[key].keys.each do |inner_key|
				puts key + " --> " + menu_options.valid_options[key][inner_key]
			end
		end

		print "\nPlease choose one of these valid options to operate on '" + @user + "' > "

		input_letter_option = gets.chomp

		menu_options.chooser(input_letter_option)

	end

	def get_username

		@user = ""

		keep_going = 1

		while keep_going == 1

			print "Please enter user name, no spaces (at least 5 alphanumeric characters) > "

			temp_name = gets.chomp

			if (temp_name =~ /\s/)

				puts "User name cannot contain spaces"

			elsif (temp_name =~ /\W/)

				puts "User name can only contain Alpha Numeric characters"

			elsif temp_name.length < 5

				puts "User name must be at least five characters long"

			else

				@user = temp_name

				puts "Your User Name is " + @user.to_s

				keep_going = 0
			end
		end
	end

	def get_passwd

		@passwd = ""

		keep_going = 1

		while keep_going == 1

			print "Please enter password, no spaces, at least one non-alphanumeric and 5 characters > "

			temp_passwd = gets.chomp

			if (temp_passwd =~ /\s/)

				puts "Passwd cannot contain spaces"

			elsif (temp_passwd !~ /\W/)

				puts "Passwd must contain at least one Non-Alphanumeric character"

			elsif temp_passwd.length < 5

				puts "Passwd must be at least five characters long"

			else

				@passwd = temp_passwd

				puts "Your Passwd is " + @passwd.to_s

				keep_going = 0
			end
		end
	end
end

all_users = AllUsers.new

my_first_user = User.new
my_first_user.user = "TimWatkins"
my_first_user.passwd = "abcdefgh!"

all_users.add_user(my_first_user)

my_second_user = User.new
my_second_user.user = "TonyBanana"
my_second_user.passwd = "Fruit@"

all_users.add_user(my_second_user)

#my_confirm = ConfirmUser.new(all_users)

#my_confirm.confirm_user

my_second_user.menu_options











