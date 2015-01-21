# SL7. They call it free will

# OK, so we got ourselves comfortable with Sinatra, and the way he plays the songs we write. That’s nice, our first web applications!
# Remember this moment :)

# Now I want you to think on a small web application with no UX at all and just a bit of interaction with a web client. You can do iterations
# on it so you add one feature at a time.

# Take a moment to read a bit of Sinatra documentation (test yourself!) and play with this tiny web framework. Use several routes, redirects,
# parameters and conditions.

# Go ahead! :D

require 'sinatra'
require 'sinatra/reloader'

class Songs

	attr_accessor :songs

	def initialize

		@songs = []

	end

	def add_song(name, artist)

		unless @songs.size >= 12

			@songs.push([name, artist])
		end
	end
end

sing_song = Songs.new

sing_song.add_song('Name', 'Artist')
sing_song.add_song('====', '======')

set :port, 3003
set :bind, '0.0.0.0'

visits ||= 0

get '/' do
	
	a_var = ""

	sing_song.songs.each do |list_arr|

		a_var += list_arr[0].to_s + ' ' + list_arr[1].to_s + '<br>'
			
	end

	a_var
end

get '/enough' do
  'Current music IS WORTH F***ING NOTHING'
end

post '/songs/new' do

	if sing_song.songs.size >= 12
		redirect '/enough'
	else
    	sing_song.add_song(params[:artist], params[:name])
    	redirect '/'
    end
end
