$LOAD_PATH << File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'
require 'sinatras-hat'

load 'lib/article.rb'

class MountedApp < Sinatra::Base
  set :app_file, __FILE__
  
  mount Article
  
  run!
end
