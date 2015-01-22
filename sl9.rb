# SL10. The online calculator

# OK, enough TV shows and songs for now. It’s not that we don’t like music, but sometimes you have to stop enjoying awesome stuff, and go to
# more boring things in order to appreciate them.

# Anyway. We are in the Internet era, so everything goes online. We order stuff online, we watch TV shows online, we buy music online, we even
# change the world through Twitter… so why not calculating online? Does it make sense? (Einstein silently agrees).

# Decided: we will implement a simple calculator so first grade students can use it from their iPhones while doing their exams. You will think:
# "but iOS and Android have a built-in calculator! Are you crazy?”. Well, it definitely has, but OURS IS ONLINE!!!

# So, our Online Calculator will:
# * Have a home page (‘/‘) where you see all four available operations: add, substract, multiply and divide. Pretty simple stuff.
# * For each one of the available operations, we will have a form with two input fields and a button, which will go to another URL/route and
# display the result, like “The multiplication of 4 and 15 is 60” or “The addition of 10 and 39 is 49".
# * There will also be a link, in the home page, that goes to ‘/counting’ and should display the numbers from 1 to 200, one number per line.

# Feel free to add more features! :D


require 'sinatra'
require 'sinatra/reloader'

class Calculator

	attr_accessor :last_result

	def initialize

		@last_result = nil

	end

	def add(add1, add2)

		add1.to_i + add2.to_i
	end

	def subtract(sub1, sub2)

		result = sub1.to_i - sub2.to_i

		((result * 100).round / 100.0)

	end

	def multiply(mult1, mult2)

		mult1.to_i * mult2.to_i

	end

	def divide(div1, div2)

		input1 = Float(div1.to_i)
		input2 = Float(div2.to_i)

		if input2 == 0.0
			:infinity
		else
			(input1/input2)
		end
	end
end

calc = Calculator.new

set :port, 3000
set :bind, '0.0.0.0'

get '/' do

	@last_result = calc.last_result
	result = nil

	unless(params[:num1].nil?) 

		if(params[:radio_action] == "add")

			result = calc.add(params[:num1], params[:num2])

		elsif(params[:radio_action] == "subtract")

			result = calc.subtract(params[:num1], params[:num2])

		elsif(params[:radio_action] == "multiply")

			result = calc.multiply(params[:num1], params[:num2])

		elsif(params[:radio_action] == "divide")

			result = calc.divide(params[:num1], params[:num2])

		end
	end

	if result == :infinity
		@last_result = "You cannot divide by zero"
	else
		unless(result.nil?)
			@last_result = params[:num1].to_s + " " + params[:radio_action].to_s + " " + params[:num2].to_s + " = " + result.to_s
		end
	end

	calc.last_result = @last_result

	erb :calculator
end
