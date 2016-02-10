require 'sinatra/base'
require_relative 'models/link'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/' do
    'Bookmark Manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split.each do |name|
      tag = Tag.first_or_create(name: name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
