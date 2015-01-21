# SL9. Spotinatra Premium

# Now we will add some features to our awesome and shiny Spotinatra web app (exercise SL6, if you remember from today):
# * Instead of adding a song through "curl", we will create a form in the "/" route that allows us to create new song.
# * Instead of just printing the songs as a string, we will use an ERB template to do that, using the HTML <ul> and <li> elements.
# * Instead of just printing “ENOUGH”, we will use an ERB template to print an <h1> with “enough”
# * Instead of saving the songs in an array, we will create a SongList class that has one “add_song” method, which will take an author and a
# name as parameters, and add the information to the song list.

# Also, we will have a couple more features:
# * We will have a dynamic route, like "/artists/:artist" that, for the "artist" parameter, prints all the songs that we have from him/her
# in our songs list.
# * We will have a "/search" route that, with a "term" parameter, prints all the artists and the songs which match the "term" parameter.

# Enjoy!


require 'sinatra'
require 'sinatra/reloader'
require 'imdb'

class ImdbAccess

	attr_accessor :imdb_top_250

	def initialize

		@imdb_top_250 = Imdb::Top250.new

	end

	def top_movie_names(limit)

		counter = 0
		rating_hash = {}

		@imdb_top_250.movies.each do |movie|

			counter += 1

			rating_hash[movie.title] = movie.rating

			if counter >= limit
				break
			end
		end

		rating_hash
	end

	def get_movies(term)
		Imdb::Search.new(term)
	end

	def get_id(name)
		Imdb::Search.new(name).movies.first.id
	end

	def get_movie(id)
		Imdb::Movie.new(id)
	end

end

imbd_obj = ImdbAccess.new()

set :port, 3000
set :bind, '0.0.0.0'

visits ||= 0

get '/top250' do

	limit = 3

	unless(params[:limit].nil?) 
		limit = params[:limit]
	end
	
	html_output = "<h1>Top " + limit.to_s + " Movies</h1><br>"

	movie_hash = imbd_obj.top_movie_names(limit.to_i)
	
	movie_hash.keys.each do |movie_title|

		html_output += movie_title.to_s + ", Rating => " + movie_hash[movie_title].to_s + '<br>'
			
	end

	html_output
end

# 2. GET '/rating' will get the rating for a specific movie or TV show. If "id" is passed, we will use this "id" directly to fetch
# the movie or show. If "name" is passed instead, we will search for that name and get the first result. Also, if the rating is lower than 5,
# we will go to a '/warning' page directly, advising of the dangers of watching that movie/show.

get '/rating' do

	id = nil

	if(params[:id].nil?) 

		# Get the ID

		id = imbd_obj.get_id(params[:name])

	else
		id = params[:id]
	end

	movie = imbd_obj.get_movie(id)

	if movie.rating <= 5
		redirect '/warning?id=' + id.to_s
	end

	"Movie Title => " + movie.title.to_s + ", Rating => " + movie.rating.to_s + ", ID => " + id.to_s + "<br>"

end

get '/warning' do

	movie = imbd_obj.get_movie(params[:id])

	"TERRIBLE! Movie Title => " + movie.title.to_s + ", Rating => " + movie.rating.to_s + ", ID => " + params[:id].to_s + "<br>"
end

# 3. GET '/info' will get all the information for a specific movie or TV show: name, year of release, cast members... you name it.
# Again, we will use "id" or "name" params to fetch it.

get '/info' do

	id = nil

	if(params[:id].nil?) 

		# Get the ID

		id = imbd_obj.get_id(params[:name])

	else
		id = params[:id]
	end

	movie = imbd_obj.get_movie(params[:id])

	"Movie: " + movie.title.to_s + '<br>' +
	"Director: " + movie.director.first.to_s + '<br>' +
	"Rating: " + movie.rating.to_s + '<br>' +
	"Poster: <img src=" + movie.poster.to_s + "/>"
end

get '/results' do

	html_out = ""

	puts params[:term].to_s

	counter = 0

	imbd_obj.get_movies(params[:term]).movies.each do |movie|

		counter += 1

		puts movie.title.to_s

		html_out += movie.title.to_s + ", " + movie.rating.to_s + ", " + movie.id.to_s + "<br>"

		if counter >= 5
			break
		end
	end

	html_out

end

get '/now' do

	DateTime.now.to_s
end

