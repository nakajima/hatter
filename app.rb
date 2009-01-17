$LOAD_PATH << File.dirname(__FILE__)

require 'lib/support'

class Hatter < Sinatra::Base
  configure do
    load 'lib/article.rb'
    load 'lib/comment.rb'
  end
  
  mount Article
end

Hatter.class_eval do
  set :app_file, __FILE__
  
  run! if __FILE__ == $0
end
