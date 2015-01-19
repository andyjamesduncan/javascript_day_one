# SL1. The calculator

# We’ll start with something nice and easy so we learn this testing thing quickly.

# Write a class, called Calculator, that basically performs all four basic math operations: addition, 
# substraction, multiplication and
# division. In order to keep it simple, all of them will have two numeric parameters.

# After writing your class, write several tests. For each one, print “OK” if it succeeded, 
# “FAIL” otherwise, in order to test that
# everything is working out properly.

class Calculator

	def add(add1, add2)

		return add1 + add2
	end

	def subtract(sub1, sub2)

		result = sub1 - sub2

		return ((result * 100).round / 100.0)

	end

	def multiply(mult1, mult2)

		return mult1 * mult2

	end

	def divide(div1, div2)

		input1 = Float(div1)
		input2 = Float(div2)

		retvalue = 0.0

		if div2 == 0.0
			retvalue = :infinity
		else
			retvalue = (input1/input2)
		end
 	
		return retvalue
	end
end