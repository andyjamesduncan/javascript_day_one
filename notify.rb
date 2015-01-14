class Email

	def hello(text)

		puts "Hello " + text + " from Email! :-)"

	end

end

class Twitter

	def hello(text)

		puts "Hello " + text + " from Twitter! :-)"

	end
end

class Facebook

	def hello(text)

		puts "Hello " + text + " from Facebook! :-)"

	end

end

class ShoutLoudly

	def hello(text)

		puts "Hello " + text + " from ShoutLoudly! :-)"

	end

end

class NotificatorFactory

	def self.from_brand(brand)

		puts "brand: " + brand

 		if brand == "email"
			Email.new
		elsif brand == "twitter"
			Twitter.new
		elsif brand == "facebook"
			Facebook.new
		else
			ShoutLoudly.new
		end
	end
end

name = "Pepe"

print "e/t/f/x ?> "

comm = gets.chomp

puts "comm: " + comm

notify = ""

if comm == "e"
	notify = "email"
elsif comm == "t"
	notify = "twitter"
elsif comm == "f"
	notify = "facebook"
end

my_notify = NotificatorFactory.from_brand(notify)

my_notify.hello(name)


