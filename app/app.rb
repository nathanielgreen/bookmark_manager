require 'sinatra/base'
require './lib/data_mapper_setup'


class Bookmark_manager < Sinatra::Base
  get '/' do
    'Hello bookmark_manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/addlink'
  end

  post '/links/new' do
    @url   = params[:url]
    @title = params[:title]
    @tag   = params[:tag]
    link = Link.create(url: @url, title: @title, tag: @tag)
    tag = Tag.create(name: @tag)
    link.tags << tag
    link.save
    redirect 'links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
