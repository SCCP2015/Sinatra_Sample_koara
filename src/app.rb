# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database'

class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  get '/' do
    Database.instance.read
  end
  post '/' do
    body = request.body.gets
    Database.instance.addwrite(body)
  end
  put '/' do
    body = request.body.gets
    Database.instance.newwrite(body)
  end
  delete '/' do
    Database.instance.delete
  end
end
