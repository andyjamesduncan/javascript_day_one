class Blog

	attr_accessor :blog_title, :blog_date, :blog_text, :blog_sponsor

	def initialize(blog_title, blog_date, blog_text, blog_sponsor)

		@blog_title = "Title: " + blog_title
		@blog_date =  "Date:  " + blog_date
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

		puts @blog_date

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
	"12th January 2015", 
	"David Cameron is a terrible hypocrite",
	"Goldman Banana")

first_blog_post.front_page
