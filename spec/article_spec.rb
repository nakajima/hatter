require 'spec/spec_helper'

describe Article do
  include Fixjour
  
  it "can be created" do
    proc {
      new_article.save!
    }.should change(Article, :count)
  end
  
  describe "validations" do
    it "requires name" do
      article = new_article(:name => nil)
      article.should_not be_valid
      article.errors.on(:name).should_not be_nil
    end
    
    it "requires body" do
      article = new_article(:body => nil)
      article.should_not be_valid
      article.errors.on(:body).should_not be_nil
    end
  end
  
  describe "validations" do
    it "has many comments" do
      Article.should have_many(Comment)
    end
  end
end