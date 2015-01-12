class Car

    def initialize(car_noise)

        @car_noise = car_noise

        car_number = IO.read("carstore.txt").to_i

        car_number += 1

        IO.write("carstore.txt", car_number)

    end 

    def broom

        puts @car_noise
       
    end

    def self.num_of_cars

        puts IO.read("carstore.txt").to_i

    end

end

class RaceCar < Car

    def initialize
        super("RedBull")
    end

    def broom
        puts "RaceCar BROOM"
    end

end

sounds = ["Flute", "Violin", "Trombone"]

car_array = sounds.map do |item|
    Car.new(item)
end

car_array.each do |item|
    item.broom
end

