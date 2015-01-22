# SL11. Valid students are valid students

# You loved the exampled about students, huh? Let’s student you up then!

# We just have a really nice student class, but we are worried that our dog adds some typo into it, so we wanna be sure that we can check it’s working as we want it to, automagically.

# How could we do that? Let me think…

# OH, YEAH! TESTING!

# So we are going to do some nice testing and implementation on this Student class with the following:
# 1. First, add tests for each one of the validations we have. Check that if we don’t have a name for a student then the student is not valid,
# same for surnames; also check that if we have an 11 year old student we won’t accept him (yet), and so on.
# 2. Add a “complete_name” method, but with the help of TDD. Remember: add the tests about the behaviour, then the tests will fail, and
# finally just implement the method and all tests will pass again.
# 3. Once all the specs pass add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Xavier” name, because we want him to be the only Xavier in Ironhack <3 (repeat
# the same with “Nick”, because we love him starting at us doing yoga)
# 4. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.


require 'sinatra'
require 'sinatra/reloader'

enable :sessions

class Student

	@@student_index = 0

	attr_accessor :student_arr

	def initialize
		@student_arr = []
	end

	def add_student(name)

		@@student_index += 1

		@student_arr.push( [name, @@student_index] )

	end
end

students = Student.new

set :port, 3000
set :bind, '0.0.0.0'

get '/' do

	unless(session[:students].nil?)
		students = session[:students]
	end

	unless(params[:student].nil?)
		students.add_student(params[:student])
	end

	@studentlist = students.student_arr

	session[:students] = students

	erb :student

end