class Car

    # @@number_of_cars = 0

    def initialize(car_type)

        @car_type = car_type

        car_number = IO.read("carstore.txt").to_i

        car_number += 1

        # @@number_of_cars = car_number

        # car_number = car_number.to_s

        IO.write("carstore.txt", car_number)

    end 

    def broom

        if @car_type == "Ferrari" 
            puts "Broom!"

        elsif @car_type == "Lamborghini"
            puts "BROOOOOOMMMM!!!"

        else
            puts "You need a GOOD car! :-)"
            puts "Try again..."

        end
       
    end

    def self.num_of_cars

        puts IO.read("carstore.txt").to_i

    end

end

class RaceCar < Car

    def broom
        puts "BROOM Race Car"

    end

end

# aCar = Car.new("Ferrari").broom
# bCar = Car.new("Lamborghini").broom
# cCar = Car.new("Ford").broom

race_car = RaceCar.new("RedBull").broom

Car.num_of_cars

