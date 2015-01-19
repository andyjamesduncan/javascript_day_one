# Series test

require_relative 'SeriesMasterOfTheUniverse.rb'

require 'imdb'
require 'pp'

smou = SeriesMasterOfTheUniverse.new

#puts "Seasons: " + smou.most_episodes(["Friends", "Breaking Bad"]).to_s

object = smou.top_movies(3)

pp object