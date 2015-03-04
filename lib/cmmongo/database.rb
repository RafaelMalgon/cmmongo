require 'cmmongo/configuration'
require 'sequel'
require 'mongoid'

class DatabaseConnector

  @@connection
  
  def initialize path = '../../conf/database'
    @conf = Configuration.new path
  end

  def connection env
    @@connection ||= Sequel.connect(
      adapter: @conf.send(env).adapter, 
      host: @conf.send(env).host, 
      database: @conf.send(env).database, 
      user: @conf.send(env).user, 
      password: @conf.send(env).password)
  end

end

class MongoConnector

  @@connection
  
  def initialize path = '../../conf/mongo.yml'
    @path = path
  end

  def connection env
    @@connection ||= Mongoid.load!(File.join(File.dirname(File.expand_path(__FILE__)), @path), env)
  end

end