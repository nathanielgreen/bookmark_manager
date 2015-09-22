require 'sinatra/base'

class Bookmark_manager < Sinatra::Base
  get '/' do
    'Hello bookmark_manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
