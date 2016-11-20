class NewsletterMailer < ApplicationMailer
  def new_notice(newsletter)
    @newsletter = newsletter
    Subscriber.all.each do |user|
      if newsletter.language == user.locale
        mail(to: user.email, subject: "World Tech Makers")
      end
    end
  end
  
  def course_notice(newsletter, tipo_mensaje)
    @newsletter = newsletter
    Interested.all.each do |user|
      if user.desc.include? tipo_mensaje and user.locale == newsletter.language
        mail(to: user.email, subject: "World Tech Makers")
      end
    end
  end
  
  def notice_all(newsletter)
    @newsletter = newsletter
    all_u = []
    Interested.all.each do |user|
      if user.locale == newsletter.language
        all_u << user.email
      end
    end
    Subscriber.all.each do |user|
      if user.locale == newsletter.language
        all_u << user.email
      end
    end
    all_u.uniq!
    all_u.each do |user|
      mail(to: user, subject: "World Tech Makers")
    end
  end
end
  
      