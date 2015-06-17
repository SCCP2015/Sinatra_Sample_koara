require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'
require 'data_mapper'
require_relative 'word'

DataMapper::Logger.new($stdout,  :debug)
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')


# Main App
class MainApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/words' do
    json(Word.all)
  end

  get '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      json(error: "id:#{:id} is not found.")
    else
      json(word)
    end
  end
  post '/words' do
    Word.create(msg: request.body.gets).id.to_json
  end
  put '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil? 
      json(false)
    else
      word.update(msg: request.body.gets)
      json(true)
    end
  end
  
  delete '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil? 
      json(false)
    else
      json(word.destroy)
    end
  end
end
