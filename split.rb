puts "Please write a sample sentence..."

input = gets.chomp

puts "Original Sentence: >#{input}<"

input.gsub!(/[\W]/, " ")

puts "Clean Sentence, without punctuation: >#{input}<"

values = input.split()

puts "\nUnsorted"

values.each do |element|

    puts "String: #{element}"

end

values.sort!{ |a,b| a.upcase <=> b.upcase}

puts "\nSorted"

values.each do |element|

    puts "String: #{element}"

end

