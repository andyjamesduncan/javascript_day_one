require 'time'

class Profanity

	def initialize(profanities)

		@profanities = []
		@profanities = profanities

	end
end

class AllSrtEntries

	attr_accessor :srt_array_input, :srt_array_output, :profanities

	def initialize 

		@srt_array_input = []
		@srt_array_output = []
		@profanities = []
	end

	def add_entry(my_srt_object)

		@srt_array_input << my_srt_object

	end

	def produce_new_time_file (time_change, file_ptr, profanities)

		@srt_array_input.each do |srt_element|

			@srt_array_output << SrtEntry.new(
					srt_element.sequence, 
					srt_element.text, 
					srt_element.time1 + time_change,
					srt_element.time2 + time_change)
		end

		profanity_switch = 1

		the_hour = 0
		the_minute = 0

		@srt_array_output.each do |srt_element|

			file_ptr.puts(srt_element.sequence)

			time_string = 
				srt_element.time1.strftime("%H:%M:%S,%L") +
				" --> " +
				srt_element.time2.strftime("%H:%M:%S,%L")

			if profanity_switch

				the_hour = srt_element.time1.strftime("%H").to_i

				if the_hour > 0

					profanity_switch = 0
					file_ptr.puts(srt_element.text)
				else
					the_minute = srt_element.time1.strftime("%M").to_i

					if the_minute >= 30

						profanity_switch = 0
						file_ptr.puts(srt_element.text)
					else

						# replace profanities here
					end
				end

			else
				file_ptr.puts(srt_element.text)
			end

			file_ptr.puts("")
		end

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

profanity_text = "profanity.txt"

profanity_file = File.open(profanity_text, "r")

profanities = profanity_file.read

profanities_array = profanities.split(/\n/)

puts "Profanities are: "

profanities_array.each do |profanity|

	puts ">" + profanity + "<"

end

print "What is your input SRT file? > "

srt_input_file = gets.chomp

srt_input_file = "original_srt.txt"

in_file = File.open(srt_input_file, "r")

print "What is your output SRT file? > "

srt_output_file = gets.chomp

srt_output_file = "output_srt.txt"

out_file = File.open(srt_output_file, "w")

puts "Input file:  " + srt_input_file
puts "Output file: " + srt_output_file

contents = in_file.read

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

desired_seconds = 0

print "How many seconds would you like to change by? > "

# desired_seconds = gets.chomp.to_i

desired_seconds = -10

puts "You want a change of #{desired_seconds} seconds..."

file = File.open(srt_output_file, "w")

all_srts.profanities = profanities_array

all_srts.produce_new_time_file(desired_seconds, file)

