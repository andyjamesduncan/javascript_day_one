require_relative 'Lexiconomitron.rb'

lex1 = Lexiconomitron.new

ret_str = lex1.eat_Ts("To sit in solemn silence")

puts "ret_str: >" + ret_str.to_s + "<"

puts lex1.all_in_line(["words", "are", "tremendously", "nice"], '$').to_s