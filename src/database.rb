# coding utf-8
require 'singleton'

class Database < Sinatra::Base
  include Singleton

  FILE = 'data'

  def read
    if File.exist?(FILE)
      File.read(FILE)
    else
      ''
    end
  end

  def addwrite(body)
    body = body + "/n"
    if File.exist?(FILE)
      read = File.read(FILE)
      File.write(FILE,read + body)
      read + body
    else
      File.write(FILE,body)
      body
    end
  end

  def newwrite(body)
    body = body + '/n'
    if File.exist?(FILE)
      File.write(FILE,body)
      body
    end
  end
  
  def delete
    File.write(FILE,'')
    ''
  end
end
