class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_courses
  layout :layout_by_resource
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options(options={})
      { locale: I18n.locale }
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
