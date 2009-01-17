require 'rubygems'
require 'sinatra/base'
require 'sinatra/test/rspec'

require File.join(File.dirname(__FILE__), *%w[.. app])

require File.join(File.dirname(__FILE__), *%w[.. lib article])
require File.join(File.dirname(__FILE__), *%w[.. lib comment])

require File.join(File.dirname(__FILE__), *%w[matchers have_many])

require 'fixjour'

Fixjour do
  define_builder(Article) do |klass, overrides|
    klass.new :name => "An Article", :body => "It's pretty good."
  end
end

