class Car
	def initialize(noisy_thing)
		@noisy_thing = noisy_thing
	end

	def make_noise
		puts "Car Noise " + @noisy_thing.make_noise
	end
end

class Duck
	def make_noise
		"Quack"
	end
end

class Dog
	def make_noise
		"Bark"
	end
end

class Engine
	def make_noise
		"Vroom"
	end
end

[Dog.new, Duck.new, Engine.new].each {|item| Car.new(item).make_noise }
