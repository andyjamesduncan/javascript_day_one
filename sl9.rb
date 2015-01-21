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

	"#{a_var}"
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
