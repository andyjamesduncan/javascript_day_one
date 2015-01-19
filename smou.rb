# Series test

require_relative 'SeriesMasterOfTheUniverse'

smou = SeriesMasterOfTheUniverse.new

puts "Best: " + smou.best_series( [ "Star Trek", "Firefly", "Big Bang"] ).to_s

puts "Worst: " + smou.worst_series( [ "Star Trek", "Firefly", "Big Bang"] ).to_s

