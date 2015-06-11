# coding: utf-8
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'database'
require_relative 'sessions_helper'


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')

# Sinatra Main controller
class MainApp < Sinatra::Base
  include SessionsHelper
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  get ' /words' do
    json(Word.all)
  end
  get '/words/:id' do
    id params[:id]
    word = Word.get(id)
    if word.nil?
      json(error: "id:#{id} is not found.")
    else
      json(word)
    end
  end
  post '/words' do
    Word.create(msg: request.body.gets).id.to_json
  end
end

