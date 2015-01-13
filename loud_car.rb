class Car

	attr_accessor :car_name, :car_noise

	def initialize(car_name, car_noise)

		@car_name = car_name
		@car_noise = car_noise
	end

	def <=> (other_car)
		car_noise <=> other_car.car_noise
	end
end

class CarTransport
	include Enumerable

	def initialize
		@car_array = []
	end

	def car_putter(obj_ref)

		@car_array << obj_ref
	end

	def return_car_array

		@car_array
	end

	def each(&block)
		@car_array.each(&block)
	end

end

car_transport = CarTransport.new

car_transport.car_putter(Car.new("Ferrari", "Roar"))
car_transport.car_putter(Car.new("Lamborghini", "Vrrooooom"))

puts car_transport.max.car_name





