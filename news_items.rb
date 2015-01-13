require 'terminfo'

class NewsItem

	attr_accessor :news_item_text
	attr_accessor :screen_height
	attr_accessor :screen_width
	attr_accessor :display_x
	attr_accessor :display_y

	def initialize(news_item_text, screen_height, screen_width)

		@news_item_text = news_item_text
		@screen_height = screen_height
		@screen_width = screen_width

		@display_y = (screen_height - 2)/2
		@display_x = (screen_width - news_item_text.length)/2

	end

	def project()

		1.step(@display_y,1) { puts "" }

		left_string = ""

		1.step(@display_x,1) do
			left_string += " "
		end

		left_string += @news_item_text

		puts left_string

		1.step(@display_y,1) { puts "" }

	end

end

class ScrollDisplay
	
	attr_accessor :all_news_items

	@@sequencer = 0
	@@max_sequencer = 0

	def initialize
		@all_news_items = Hash.new
	end

	def put_into_news_stream(news_object)

		@@sequencer += 1

		@@max_sequencer = @@sequencer

		@all_news_items[@@sequencer] = news_object

	end

	def max_sequence
		@@max_sequencer
	end
end

file = File.open("news_items.txt", "r")

contents = file.read

# puts contents

values = contents.split("----\n")

scroll_display = ScrollDisplay.new

values.each do |element|

 	# puts "String: #{element}"

	scroll_display.put_into_news_stream(
		NewsItem.new(element,TermInfo.screen_size[0], TermInfo.screen_size[1]))

end

my_index = 1

while 1 == 1 do
	scroll_display.all_news_items[my_index].project()

	if ((my_index == 1) && (my_index < scroll_display.max_sequence))
		print "(n/x) > "
	elsif (my_index == scroll_display.max_sequence)
		print "(p/x) > "
	else
		print "(n/p/x) >"
	end

	my_input = gets.chomp

	if (my_input == "n")
		my_index += 1
	elsif (my_input == "p")
		my_index -= 1
	else
		break
	end
end
