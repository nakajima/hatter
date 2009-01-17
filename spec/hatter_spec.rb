require 'spec/spec_helper'

describe Hatter do
  include Sinatra::Test
  
  attr_reader :response
  
  before(:each) do
    mock_app(Hatter)
  end
  
  describe "mount Article" do
    it "generates index action" do
      get '/articles'
      response.status.should == 200
    end
    
    it "can be serialized" do
      get '/articles.xml'
      response.body.should == Article.all.to_xml
    end
  end
end