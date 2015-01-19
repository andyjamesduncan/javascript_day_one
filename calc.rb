require_relative 'Calculator.rb'

# A new feature line

describe Calculator  do
	before do
		@calc = Calculator.new
	end

	describe "#addition" do
		it "Should add 1 and 2" do
			result = @calc.add(1,2)
			expect(result).to eq(3)
		end
		it "Should add 1.7 and 2.4" do
			result = @calc.add(1.7,2.4)
			expect(result).to eq(4.1)
		end
		it "Should add 1 and 2" do
			result = @calc.add(-1,2)
			expect(result).to eq(1)
		end
	end

	describe "#subtraction" do
		it "Should subtract 1 and 2" do
			result = @calc.subtract(1,2)
			expect(result).to eq(-1)
		end
		it "Should subtract 5.3 and 4" do
			result = @calc.subtract(5.3,4)
			expect(result).to eq(1.3)
		end
		it "Should subtract -1 and 2" do
			result = @calc.subtract(-1, 2)
			expect(result).to eq(-3)
		end
	end

	describe "#multiply" do
		it "Should multiply 1 and 2" do
			result = @calc.multiply(1,2)
			expect(result).to eq(2)
		end
		it "Should multiply -1 and 2" do
			result = @calc.multiply(-1,2)
			expect(result).to eq(-2)
		end
		it "Should multiply 1.6 and 2" do
			result = @calc.multiply(1.6, 2)
			expect(result).to eq(3.2)
		end
	end

	describe "#divide" do
		it "Should divide 1 and 0, to return :infinity" do
			result = @calc.divide(1, 0)
			expect(result).to eq(:infinity)
		end
		it "Should divide -1 and 2" do
			result = @calc.divide(-1, 2)
			expect(result).to eq(-0.5)
		end
	end
end



