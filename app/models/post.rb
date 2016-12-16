class Post < ActiveRecord::Base
  translates :title, :body
  belongs_to :admin
  has_many :taggings, :dependent => :delete_all 
  has_many :tags, through: :taggings 
  scope :ultimos, ->{ order("created_at DESC") }
  has_attached_file :cover, styles: { medium: "1280x720", thumb:"800x600"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ 
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end  
end
