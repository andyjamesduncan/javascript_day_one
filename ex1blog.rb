require 'date'

class Blog

	attr_accessor :blog_title, 
		:blog_dy, 
		:blog_dm, 
		:blog_dd, 
		:blog_datetime,
		:blog_full_date,
		:blog_text, 
		:blog_sponsor

	def initialize(blog_title, blog_dy, blog_dm, blog_dd, blog_text, blog_sponsor)

		@blog_title = "Title: " + blog_title
		@blog_dy =  blog_dy
		@blog_dm = blog_dm
		@blog_dd = blog_dd
		@blog_datetime = Date.new(blog_dy, blog_dm, blog_dd)
		@blog_full_date = "Date:  " + blog_dd.to_s + "/" + blog_dm.to_s + "/" + blog_dy.to_s
		@blog_text =  "Post:  " + blog_text
		@blog_sponsor = blog_sponsor

	end

	def front_page

		divider_length = 0

		btl = @blog_title.length
		bpl = @blog_text.length

		if ((btl > 80) or (bpl > 80))
			divider_length = 80
		elsif (btl > bpl)
			divider_length = btl
		else
			divider_length = bpl
		end

		print_divider("*", divider_length)

		puts @blog_title

		print_divider("-", divider_length)

		puts @blog_full_date

		print_divider("-", divider_length)

		print_sponsor

		print_divider("-", divider_length)

		puts @blog_text

		print_divider("*", divider_length)
	end

	def print_divider(div_string, div_number)

		a_string = ""

		(1..div_number).each do |item|
			a_string += div_string
		end

		puts a_string
	end

	def print_sponsor

		sponsor = "* This post brought to you by " + @blog_sponsor + " *"

		print_divider("*", sponsor.length)

		puts sponsor

		print_divider("*", sponsor.length)

	end

end

first_blog_post = Blog.new(
	"Endless Hypocrisy", 
	2015, 1, 1, 
	"David Cameron is a terrible hypocrite",
	"Goldman Banana")

second_blog_post = Blog.new(
	"Endless War", 
	2015, 1, 8, 
	"Britain Loses War in Afghanistan",
	"Vampire Squid")

third_blog_post = Blog.new(
	"Endless Taxes", 
	2014, 1, 8, 
	"More Taxes for Less",
	"Pineapple Sachs")

puts "\nNeat--------\n\n"

post_array = [first_blog_post, second_blog_post, third_blog_post]

sorted_array = 
	post_array.sort { |a,b|  a.blog_datetime <=> b.blog_datetime }

sorted_array.each do |item|
	item.front_page
end

puts "\nOne line--------\n\n"

([	first_blog_post, 
	second_blog_post, 
	third_blog_post].sort { |a,b| 	a.blog_datetime <=> 
									b.blog_datetime }).each{ |item| item.front_page }
