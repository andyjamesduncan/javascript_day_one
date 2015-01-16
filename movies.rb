require 'imdb'

line_num = 0

File.open('movies.txt').each do |line|

  	print "\n#{line_num += 1} #{line}"

 	imdb = Imdb::Search.new(line)

	imdb.movies.each do |movie|

		rating_string = ""

		count = movie.rating.to_i

		i = 0

		while i < count
			rating_string += "|"
			i += 1
		end

		puts "Movie:  " + movie.title
		puts "Rating: " + movie.rating.to_s + " " + rating_string

		break
	end
end

puts "\nBye!!! :-)\n\n"

