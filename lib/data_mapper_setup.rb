require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
DataMapper::Logger.new($stdout, :debug)

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!
