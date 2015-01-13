require 'time'

class AllSrtEntries

	attr_accessor :srt_array

	def initialize 

		@srt_array = []
	end

	def add_entry(my_srt_object)

		@srt_array << my_srt_object

	end
end

all_srts = AllSrtEntries.new

class SrtEntry

	attr_accessor 	:sequence,
					:text,
					:time1,
					:time2

	def initialize(
		sequence, 
		text, 
		time1,
		time2)

		@sequence = sequence.to_i
		@text = text
		@time1 = time1
		@time2 = time2

	end

end

file = File.open("original_srt.txt", "r")

contents = file.read

srt_array = contents.split(/\n\n/)

srt_array.each do |srt_element|

	three_element_array = []
	two_times_array = []
	time_one = 0
	time_two = 0

	three_element_array = srt_element.split(/\n/,3)

	counter = 0

	three_element_array.each do |three_element|

		#puts "###"

		counter += 1

		if counter == 2
			two_times_array = three_element.split(/ --> /)

			time_one = Time.parse(two_times_array[0])
			time_two = Time.parse(two_times_array[1])

		end
	end

	srt_object = SrtEntry.new(
		three_element_array[0].chomp,
		three_element_array[2].chomp,
		time_one,
		time_two)

	#puts "---"
	#puts srt_object.sequence
	#puts srt_object.text
	#puts srt_object.time1
	#puts srt_object.time2

	all_srts.add_entry(srt_object)

end

print "How many seconds would you like to change by? > "

desired_seconds = gets.chomp.to_i

puts "You want a change of #{desired_seconds} seconds..."

