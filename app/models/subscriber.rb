class Subscriber < ActiveRecord::Base
  validates_presence_of :email, message: I18n.t('newsletter.nomail')
  validates_uniqueness_of :email, :case_sensitive => false, message: I18n.t('newsletter.emailused')
  validates_format_of :email, with: Devise::email_regexp, message: I18n.t('newsletter.novalidmail')
  scope :ultimos, ->{ order("created_at DESC") }
end
