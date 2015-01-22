# SL11. The big user brother

# Drones for everything. Control. 1984. Like the novel? No, reality! We are constantly being watched, so at least brush your hair perfectly!

# The thing is, some an activist hacker organization hires you to design a platform were everyone can sign up and, more importantly,
# ¡everyone can see everyone! If the government has this power, everyone should!

# So. Implement a Sinatra web application where:
# - In “/“, you can see the list of users (showing their name) that have signed up and the number of users.
# - Also in “/“, there’s a form (pointing to “/signup”) with which you can sign up yourself. After you sign up, your user id (and your
# id only) is saved in session, and you can see it in the top (hint: use an internal data structure were you can save ids with 
# their corresponding names and, important: ids should be incremental and not repeat).
# - There also a “/cats” page, linked from “/“, with five pictures of cats of your choice. Do your best!

require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'activerecord.sqlite')

class Student < ActiveRecord::Base

	@@student_index_incrementer = 0

	attr_accessor :student_id, :student_name

	def initialize(name)
		@@student_index_incrementer += 1

		@student_name = name
		@student_id = @@student_index_incrementer
	end
end

fruity = Student.new('Sean')
banana = Student.new('Andy')

fruity.save
banana.save

set :port, 3000
set :bind, '0.0.0.0'

get '/' do

	student_array = Student.all

	html_out = ""

	student_array.each do |student|

		html_out += student.student_name.to_s + ' ' + student.student_id.to_s + '<br>'

	end

	html_out

end