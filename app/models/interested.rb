class Interested < ActiveRecord::Base
  validates_presence_of :email, message: I18n.t('newsletter.nomail')
  validates_format_of :email, with: Devise::email_regexp, message: I18n.t('newsletter.novalidmail')
  scope :ultimos, ->{ order("created_at DESC") }
end
