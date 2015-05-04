# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'singleton'

class MainApp < Sinatra::Base
  include Singleton
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  get '/' do
    Database.instance.read
  end
  post '/' do
    Database.instance.write(request.body.gets)
  end
  put '/' do
    Database.instance.rewrite(request.body.gets)
  end
  delete '/' do
    Database.instance.delete
  end
end
