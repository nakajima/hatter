require 'rubygems'
require 'sinatra/base'
require 'sinatra/test/rspec'

require File.join(File.dirname(__FILE__), *%w[.. app])

require File.join(File.dirname(__FILE__), *%w[.. lib article])
require File.join(File.dirname(__FILE__), *%w[.. lib comment])

require File.join(File.dirname(__FILE__), *%w[matchers have_many])

module Sinatra::Test
  # Sets up a Sinatra::Base subclass defined with the block
  # given. Used in setup or individual spec methods to establish
  # the application.
  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end
end

require 'fixjour'

Fixjour do
  define_builder(Article) do |klass, overrides|
    klass.new :name => "An Article", :body => "It's pretty good."
  end
  
  define_builder(Comment) do |klass, overrides|
    klass.new :body => "Oh, that's interesting."
  end
end

Spec::Runner.configure do |c|
  c.include Fixjour
end