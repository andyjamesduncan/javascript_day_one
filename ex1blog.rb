class Blog

	attr_accessor :blog_title
	attr_accessor :blog_date
	attr_accessor :blog_text

	def initialize(blog_title, blog_date, blog_text)

		@blog_title = blog_title
		@blog_date = blog_date
		@blog_text = blog_text

	end

	def front_page

		print_divider("*", @blog_title.length)

		puts @blog_title

		print_divider("-", @blog_title.length)

		puts @blog_date

		print_divider("-", @blog_title.length)

		puts @blog_text

		print_divider("*", @blog_title.length)
	end

	def print_divider(div_string, div_number)

		a_string = ""

		(1..div_number).each do |item|
			a_string += div_string
		end

		puts a_string
	end

end

first_blog_post = Blog.new(
	"Endless Hypocrisy", 
	"12th January 2015", 
	"David Cameron is a terrible hypocrite")

first_blog_post.front_page
