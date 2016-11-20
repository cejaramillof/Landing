class Newsletter < ActiveRecord::Base
  validates :body, presence: true
  validates :title, presence: true
  scope :ultimos, ->{ order("created_at DESC") }
end
