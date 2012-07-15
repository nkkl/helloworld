class Post < ActiveRecord::Base
  attr_accessible :body

  # validate new posts
  validates_presence_of :body
end
