$LOAD_PATH << File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'
require 'sinatras-hat'
require 'acts_as_fu'

include ActsAsFu

class Hatter < Sinatra::Base
  set :app_file, __FILE__
  
  configure do
    load 'lib/article.rb'
    load 'lib/comment.rb'
  end
  
  mount Article
end

Hatter.run! if __FILE__ == $0