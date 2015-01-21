require_relative 'Lexiconomitron.rb'

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

describe Lexiconomitron do
	before do
		@lex = Lexiconomitron.new
	end

	describe "#shazam" do
		it "shazam" do
			result = @lex.shazam(["To", "Sit", "in", "Totally", "Empty", "Fruity", "Silence"])
			expect(result).to eq(["o", "ecneliS"])
		end
	end
	describe "#oompa_loompa" do
		it "oompa_loompa" do
			result = @lex.oompa_loompa(["To", "Sit", "in", "Totally", "Empty", "Fruity", "Silence"])
			expect(result).to eq(["o", "Si", "in"])
		end
	end
	describe "#all_in_line" do
		it "all_in_line" do
			result = @lex.all_in_line(["words", "are", "tremendously", "nice"], '$')
			expect(result).to eq("remendously$words$nice$are")
		end
	end
	
	describe "#supercounter" do
		it "supercounter" do
			result = @lex.supercounter(["I", "am", "getting", "tired", "of", "your", "words"])
			expect(result).to eq(20)
		end
	end
end

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode
# 2. The median
# 3. The mean
# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)
