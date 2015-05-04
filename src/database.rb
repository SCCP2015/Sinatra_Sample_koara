# coding utf-8
require 'singleton'

class Database < Sinatra::Base
  include Singleton

  Def read
    if File.exist?(FILE)
      File.read(FILE)
    else
      ''
    end

  Def write
    body = request.body.gets + "/n"
    if File.exist?(FILE)
      read = File.read(FILE)
      File.write(FILE,read + body)
      read + body
    else
      File.write(FILE,'')
      ''
    end
  Def rewrite
    body = request.body.gets + '/n'
    if File.exist?(FILE)
      File.write(FILE,body)
    else
      ''
    end
  Def delete
    File.write(FILE,'')
    ''
end

