require_relative 'Calculator.rb'

calc = Calculator.new

print "Testing Calculator add method: \n"
if calc.add(1,2) == 3
	print "OK"
else
	print "FAIL"
end
print "\n"

if calc.add(1.7,2.4) == 4.1
	print "OK"
else
	print "FAIL"
end
print "\n"

if calc.add(-1,2) == 1
	print "OK"
else
	print "FAIL"
end
print "\n"

print "Testing Calculator subtract method: \n"
if calc.subtract(1,2) == -1
	print "OK"
else
	print "FAIL"
end
print "\n"

if calc.subtract(-1,2) == -3
	print "OK"
else
	print "FAIL"
end
print "\n"

print "Testing Calculator multiply method: \n"
if calc.multiply(1,2) == 2
	print "OK"
else
	print "FAIL"
end
print "\n"

if calc.multiply(-1,2) == -2
	print "OK"
else
	print "FAIL"
end
print "\n"

if calc.multiply(1.6, 2) == 3.2
	print "OK"
else
	print "FAIL"
end
print "\n"

print "Testing Calculator divide method: \n"
if calc.divide(1,0) == :infinity
	print "OK"
else
	print "FAIL"
end
print "\n"

# A new feature line

if calc.divide(-1,2) == -0.5
	print "OK"
else
	print "FAIL"
end
print "\n"