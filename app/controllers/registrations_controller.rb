class RegistrationsController < Devise::RegistrationsController
  before_filter :authorize_admin, only: :create
  prepend_before_filter :require_no_authentication, only: [:new, :cancel]
  skip_before_filter :require_no_authentication, only: [:new]
  def new
    super
  end
  def create
    super
  end
  def update
    super
  end
  def after_sign_up_path_for(resource)
    '/admins'
  end
  def after_update_path_for(resource)
    '/admins'
  end
  private
  def authorize_admin
    return unless !admin_signed_in?
      redirect_to root_path, alert: 'Admins only!'
  end
end
