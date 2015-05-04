# coding utf-8
require 'singleton'

class Database 
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
    newbody = body + "/n"
    if File.exist?(FILE)
      read = File.read(FILE)
      File.write(FILE,read + newbody)
      read + body
    else
      File.write(FILE,newbody)
      body
    end
  end

  def newwrite(body)
    newbody = body + '/n'
    if File.exist?(FILE)
      File.write(FILE,newbody)
      body
    end
  end
  
  def delete
    File.write(FILE,'')
    ''
  end
end
