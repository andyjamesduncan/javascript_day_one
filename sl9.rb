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

class Songs

	attr_accessor :songs

	def initialize

		@songs = []

	end

	def get_songs(artist)

		output = []

		@songs.each do |song|

			if song[0].include?(artist)

				output.push(song[1])

			end

		end

		output
	end

	def get_songs_by_song(term)

		output = []

		@songs.each do |song|

			if song[1].include?(term)
				output.push(song[1])
			end
		end

		output
	end

	def get_artists_by_artist(term)

		output = []

		@songs.each do |song|

			if song[0].include?(term)

				output.push(song[0])

			end

		end

		output
	end

	def add_song(name, artist)

		unless @songs.size >= 12

			@songs.push([name, artist])
		end
	end
end

sing_song = Songs.new

set :port, 3003
set :bind, '0.0.0.0'

visits ||= 0

get '/' do
	
	@songlist = sing_song.songs
	erb :today
end

get '/enough' do
  erb :name
end

post '/songs/new' do

	if sing_song.songs.size >= 12
		redirect '/enough'
	else
    	sing_song.add_song(params[:artist], params[:name])
    	redirect '/'
    end
end

get '/artist/:artist' do

	@artist = params[:artist]

	@artist_songs = sing_song.get_songs(@artist)

	erb :artist_songs

end

get '/search/:term' do

	@term = params[:term]

	@songs = sing_song.get_songs_by_song(@term)

	@artists = sing_song.get_artists_by_artist(@term)

	erb :songs_and_artists
end

post '/newsong' do

	if sing_song.songs.size >= 10
		redirect '/enough'
	else
    	sing_song.add_song(params[:artist], params[:name])
    	redirect '/'
    end
end
