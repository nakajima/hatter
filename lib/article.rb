require 'acts_as_fu'
include ActsAsFu

configure do
  build_model(:articles) do
    string :name
    text :body
  end
end

