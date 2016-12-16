class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_courses
  layout :layout_by_resource
  
  def set_locale
    if params[:locale].blank?
      c = request.location.country_code
      case c
        when 'US'
         l = :en        
        when 'MX'
         l = :es
        when 'CO'
         l = :es
        when 'BR'
         l = :br          
        else
         locale ||= I18n.default_locale
       end
    else
      l = params[:locale]
    end
    I18n.locale = l
  end  
  
  def default_url_options(options={})
    { locale: I18n.locale }
  end
  
  def change_locale
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:educator_locale] = l
    redirect_to request.referer || root_url
  end  
  
  protected
  def layout_by_resource
    if devise_controller?
      "dashboard"
    else
      "application"
    end
  end
  def after_sign_up_path_for(admin)
    after_sign_in_path_for(resource)
  end
  def set_courses
    @courses = Course.all
  end
end
