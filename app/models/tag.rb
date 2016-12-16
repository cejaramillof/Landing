class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :delete_all
  has_many :posts, through: :taggings  
end
