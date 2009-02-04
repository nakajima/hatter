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
  
  describe "mount Comment" do
    before(:each) do
      @article = create_article
    end
    
    describe "creating a comment" do
      def do_post
        post "/articles/#{@article.to_param}/comments", "comment[body]" => "Hello!"
      end
      
      it "redirects to article after create" do
        proc {
          do_post
        }.should change(@article.comments, :count)
      end
    end
  end
end