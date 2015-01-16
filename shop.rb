require 'pp'
require 'awesome_print'

class FreeDifferentStuff

	attr_accessor :other_free_stuff

	def initialize

		@get_some_free_hash = 	{  	"Grape"		=>	[4, { "Banana" => 1 }]
								}
	end

	def get_free_stuff(shopping_cart)

		@get_some_free_hash.keys.each do |item|

			to_get = @get_some_free_hash[item][0]

			offer_key = ""

			@get_some_free_hash[item][1].keys.each {|inner_key| offer_key = inner_key } 

			puts "Offer Key: " + offer_key.to_s

			free_things = @get_some_free_hash[item][1][offer_key]

			puts 	"If you have " + to_get.to_s + " " + item.to_s + "s, you can have " +
					free_things.to_s + " free " + offer_key.to_s + "s"

			total_bought = 0

			if shopping_cart.track_item_types[item]
				total_bought = shopping_cart.track_item_types[item]
			end

			total_free = (total_bought / to_get).to_i

			puts 	"You have " + total_bought.to_s + " " + item.to_s + "s, so you can have " + 
					total_free.to_s + " free " + offer_key.to_s + "s"

			if total_free > 0

				print "\nDo you want them? (y/n) > "

				input = gets.chomp

				if input == "y"

					counter = 0

					while counter < total_free
					
						Kernel.const_get(offer_key.to_s).new(0)

						shopping_cart.track_item_types[offer_key] += 1

						counter += 1
					end
				end
			end
		end
	end
end

class GetSomeFree

	attr_accessor :get_some_free_hash

	def initialize

		@get_some_free_hash = 	{  	"Apple"		=>	[2, 1],
									"Orange"	=>	[3, 2]
								}
	end

	def apply_discounts(shopping_cart, set_prices)

		@get_some_free_hash.keys.each do |item|

			to_get = @get_some_free_hash[item][0]
			taken_off = @get_some_free_hash[item][0] - @get_some_free_hash[item][1]

			total_bought = 0

			if shopping_cart.track_item_types[item]
				total_bought = shopping_cart.track_item_types[item]
			end

			total_taken_off = (total_bought / to_get).to_i

			puts 	"Class: " + item.to_s + ", Total Bought: " + total_bought.to_s + 
					", Need to get: " + to_get.to_s + ", Taken off: " + taken_off.to_s +
					", So reduce by: " + total_taken_off.to_s

			if total_taken_off > 0

				single_price_off = set_prices.all_products_and_prices[item]
				total_reduction = total_taken_off * single_price_off

				puts 	total_taken_off.to_s + " " + item.to_s + 
						"s taken off, @" + single_price_off.to_s + " each, = -" +
						total_reduction.to_s

				shopping_cart.total_cost -= total_reduction
			end
		end
	end
end

class ShoppingCart

	attr_accessor :bought_items, :total_cost, :track_item_types

	def initialize

		@bought_items = [];
		@track_item_types = {}

	end
end

class Apple < Struct.new(:cost)

	attr_accessor :cost

	def initialize(cost)
		@cost = cost
	end
end

class Orange < Struct.new(:cost)

	attr_accessor :cost

	def initialize(cost)
		@cost = cost
	end
end

class Grape < Struct.new(:cost)

	attr_accessor :cost

	def initialize(cost)
		@cost = cost
	end
end

class Banana < Struct.new(:cost)

	attr_accessor :cost

	def initialize(cost)
		@cost = cost
	end
end

class Watermelon < Struct.new(:cost)

	attr_accessor :cost

	def initialize(cost)
		@cost = cost
	end
end

class SpecialDays

	attr_accessor :days

	def initialize

		@days = {	"1" => "Monday", 
					"2" => "Tuesday", 
					"3" => "Wednesday", 
					"4" => "Thursday",
					"5" => "Friday",
					"6" => "Saturday",
					"7" => "Sunday"
				}
	end

	def get_day

		puts "\nPlease input a day:\n\n"

		@days.keys.each do |key|
			puts "[" + key.to_s + "] " + days[key]
		end
		
		print "\nWhat day is it? > "

		input = gets.chomp

		return @days[input]

	end
end

class SetSeason

	attr_accessor :seasons

	def initialize

		@seasons = { "1" => "Spring", "2" => "Summer", "3" => "Autumn", "4" => "Winter"}
	end

	def get_season

		puts "Please input a season:\n\n"

		@seasons.keys.each do |key|
			puts "[" + key.to_s + "] " + seasons[key]
		end
		
		print "\nWhat season is it? > "

		input = gets.chomp

		return @seasons[input]

	end
end

class SetPrices

	attr_accessor :all_products_and_prices, :seasonal_prices

	def initialize

		set_season = SetSeason.new

		season = set_season.get_season

		puts "\nThe season is: " + season.to_s + "\n"

		@seasonal_prices = {"Apple" 	=>	{ "Spring" => 10, "Summer" => 10, "Autumn" => 15, "Winter" => 12 },
							"Orange"	=>	{ "Spring" => 5,	"Summer" => 2, "Autumn" => 5, "Winter" => 5 },
							"Grape"		=>	{ "Spring" => 15, "Summer" => 15, "Autumn" => 15, "Winter" => 15 },
							"Banana"	=>	{ "Spring" => 20, "Summer" => 20, "Autumn" => 20, "Winter" => 21},
							"Watermelon" =>	{ "Spring" => 50, "Summer" => 50, "Autumn" => 50, "Winter" => 50 }
						}

		@special_days = { "Watermelon" => { "Sunday" => 2 } }

		@all_products_and_prices = {}

		@seasonal_prices.keys.each do |item|
			@all_products_and_prices[item] = @seasonal_prices[item][season]
		end

		special_day = SpecialDays.new

		day = special_day.get_day

		puts "\nThe day is: " + day.to_s + "\n"

		@special_days.keys.each do |item|
			if @special_days[item][day]
				@all_products_and_prices[item] *= @special_days[item][day]
			end
		end
	end
end

# Main

puts "\nWelcome to the Monkey Nuts shopping experience\n\n"

set_prices = SetPrices.new

puts "\nAvailable products and prices:\n\n"

set_prices.all_products_and_prices.keys.each do |key|

	puts key.to_s + " " + set_prices.all_products_and_prices[key].to_s

end

shopping_cart = ShoppingCart.new

puts "\nLet's fill your shopping cart, [q] will quit...\n\n"

total_cost = 0

set_prices.all_products_and_prices.keys.each do |key|

	shopping_cart.track_item_types[key] = 0

	print "How many " + key.to_s + "s do you want? > "

	input = gets.chomp

	if input != 'q'

		counter = 0

		while counter < input.to_i

			shopping_cart.bought_items.push(
				Kernel.const_get(key.to_s).new(set_prices.all_products_and_prices[key].to_i)
				)

			counter += 1

			total_cost += set_prices.all_products_and_prices[key].to_i

			shopping_cart.track_item_types[key] += 1

		end
	else
		break
	end
end

shopping_cart.total_cost = total_cost

puts "\nTotal cost of shopping cart is: " + shopping_cart.total_cost.to_s + "\n\n"

puts "Applying discounts...\n"

get_some_free = GetSomeFree.new

get_some_free.apply_discounts(shopping_cart, set_prices)

puts "\nTotal cost of shopping cart is now: " + shopping_cart.total_cost.to_s + "\n\n"

free_other_stuff = FreeDifferentStuff.new

puts "Applying free offers...\n"

free_other_stuff.get_free_stuff(shopping_cart)

puts "\nSummary: \n"

shopping_cart.track_item_types.keys.each do |item|

	puts item.to_s + "s " + shopping_cart.track_item_types[item].to_s

end

puts "\nCost: " + shopping_cart.total_cost.to_s + "\n"

puts "\nThank you for shopping with Monkey Nuts! :-)\n\n"








