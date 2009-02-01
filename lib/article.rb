build_model(:articles) do
  string :name
  text :body

  has_many :comments
  
  validates_presence_of :name
  validates_presence_of :body
  
  def body_html
    Maruku.new(body).to_html
  end
end

Article.create! \
:name => "Welcome to Hatter!",
:body => <<-TEXT
Hey, you're playing with the Hatter project. It's an amalgam
of some of my weird and wacky projects:
  
* ActsAsFu
* Sinatra's Hat
* Semi-Formal
  
Hope you enjoy it!

Pat
TEXT