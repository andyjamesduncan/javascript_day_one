require_relative 'Numermaster.rb'

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

describe Numermaster do
	before do
		@nm = Numermaster.new
	end

	describe "#First Array method" do
		it "Mostly positive array return" do
			result = @nm.array_handler([1,2,3,-1,-2,0,-3])
			expect(result).to eq([1,2,3,0])
		end
		it "Mostly negative array return" do
			result = @nm.array_handler([1,2,3,-1,-2,0,-3,-4,-7])
			expect(result).to eq([-1,-2,-3,-4,-7])
		end
		it "Equal positive and negative array return" do
			result = @nm.array_handler([1,2,3,-1,-2,0,-4,-7])
			expect(result).to eq(nil)
		end
		it "Equal positive and negative array return" do
			result = @nm.array_handler([])
			expect(result).to eq(nil)
		end
	end

	describe "#Second Array method" do
		it "Checking return array with decent input array of odd elements" do
			result = @nm.averages_array([1,2,3,5,4,6,7,8,9,11,10])
			expect(result).to eq([[1,2,3,4,5,6,7,8,9,10,11],6,6.0,11])
		end
		it "Checking return array with decent input array of even elements" do
			result = @nm.averages_array([1,2,3,10,5,6,7,8,9,4])
			expect(result).to eq([[1,2,3,4,5,6,7,8,9,10],5.5,5.5,10])
		end
		it "One part mode" do
			result = @nm.averages_array([2,1,2,3,2])
			expect(result).to eq([[2],2,2.0,5])
		end
		it "Two part mode" do
			result = @nm.averages_array([2,1,3,2,3,3,4,2])
			expect(result).to eq([[2,3],2.5,2.5,8])
		end
		it "Checking empty input array" do
			result = @nm.averages_array([])
			expect(result).to eq(nil)
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
