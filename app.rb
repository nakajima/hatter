$LOAD_PATH << File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'
require 'maruku'
require 'sinatras-hat'
require 'semi_formal'
require 'acts_as_fu'

include ActsAsFu

class NilClass
  def include?(*args)
    puts caller
    super
  end
end

class Hatter < Sinatra::Base
  set :static, true
  set :logging, true
  set :app_file, __FILE__
  
  include SemiFormal
  
  configure do
    load 'lib/article.rb'
    load 'lib/comment.rb'
  end
  
  get('/') { redirect('/articles') }
  
  mount Article
end

Hatter.run! if __FILE__ == $0