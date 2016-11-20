class DashboardController < ApplicationController
  before_filter :authenticate_admin!
  layout "dashboard"
  def index
  end
end
