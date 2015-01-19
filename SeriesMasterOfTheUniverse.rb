# SL2. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the tast. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

require 'imdb'

class SeriesMasterOfTheUniverse

	attr_accessor :last_srch_arr

	def imdb_search(search_string)

		Imdb::Search.new(search_string)

	end

	def series_rating(series)

		imdb_search(series).movies.first.rating

	end

	def worst_series(series_array)

		sorted_series(series_array, false)

	end

	def best_series(series_array)

		sorted_series(series_array, true)

	end

	def sorted_series(series, ascending)

		series.map { |s| [series_rating(s), s] }.sort do |movie_a, movie_b| 
			ascending ? movie_b.first <=> movie_a.first : movie_a.first <=> movie_b.first
		end.first[1]

	end
end
