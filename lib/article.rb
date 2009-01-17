build_model(:articles) do
  string :name
  text :body

  has_many :comments
  
  validates_presence_of :name
  validates_presence_of :body
end
