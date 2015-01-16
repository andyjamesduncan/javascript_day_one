class Object
	def salute
		puts "Hello! " + self.class.to_s
	end
end

class Banana

end

class Fixnum

	def to_s
		"Banana"
	end

	def +(number)

		7
	end

end

"Oh, really? ".salute
3.salute

banana = Banana.new

banana.salute

puts "Fixnum Bit"

puts 3.to_s
puts 15.to_s
puts "Hello Hello".to_s

answer = 7 + 8

puts answer

puts "Reach the end"