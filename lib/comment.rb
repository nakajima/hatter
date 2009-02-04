build_model(:comments) do
  integer :article_id
  string :body
  
  belongs_to :article
  
  validates_presence_of :body
end