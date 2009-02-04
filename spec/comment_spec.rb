require 'spec/spec_helper'

describe Comment do
  it "can be created" do
    proc {
      new_comment.save!
    }.should change(Comment, :count)
  end
  
  describe "validations" do
    it "requires body" do
      comment = new_comment(:body => nil)
      comment.should_not be_valid
      comment.errors.on(:body).should_not be_nil
    end
  end
end