# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'word'

DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')

# Sinatra Main controller
class MainApp < Sinatra::Base
# Sinatra Auto Reload
  configure :development do
  register Sinatra::Reloader
  end
  
  get '/' do
    @obj=Word.all
    erb:index
  end

  post '/' do
  Word.create(msg: params[:twit])
  @obj=Word.all
  @obj.class.to_s
  erb:index
  redirect '/'
  end

=begin
  put '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      'false'
    else
    word.update(msg: request.body.gets)
      'true'
    end
  end

  delete '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      'false'
    else
      word.destroy.to_s
    end
  end
=end
end

