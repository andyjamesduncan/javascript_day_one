class Person

    def initialize(name, age)

        @name = name
        @age = age

    end 

    def set_age(new_age)
        if new_age.is_a?(Integer)
            @age = new_age
        else
            puts "try again..."
        end
    end

    def get_age()

        @age

    end

    def get_name()

        @name

    end

end

a_new_person = Person.new("Andy", 23)
other = Person.new("Xavier", 14)

puts a_new_person.get_name
puts a_new_person.get_age
puts "+++++++++"
puts other.get_name
puts other.get_age


puts "a1"
a_new_person.set_age(24)
puts "a2"
other.set_age(23.456)
puts "a3"

puts "Age should change"

puts a_new_person.get_name
puts a_new_person.get_age
puts "+++++++++"
puts other.get_name
puts other.get_age

