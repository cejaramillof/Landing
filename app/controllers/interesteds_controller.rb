class InterestedsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new, :create]
  before_action :set_interested, only: [:edit, :update, :destroy]
  layout "dashboard"
  def index
    @interesteds = Interested.paginate(page: params[:page],per_page: 10).ultimos.all
  end
  
  def create
    courseinterested = params[:desc]
    existente = Interested.find_by_email(params[:email].downcase)
    @courses.each do |course|
      if courseinterested.include? course.name
        download_b(course.name, locale)
      end
    end
    if existente.nil?
      Interested.create(desc: params[:desc], email: params[:email].downcase, ip: params[:ip], locale: params[:locale])
    else
      if !existente.desc.include? params[:desc]
        existente.update_attributes!(desc: (existente.desc+', '+params[:desc]), email: params[:email].downcase, ip: params[:ip], locale: params[:locale])
      end
    end
  end
  
  def destroy
    @interested.destroy
    respond_to do |format|
      format.html { redirect_to interesteds_path, notice: 'Interested was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @interested.update(interested_params)
        format.html { redirect_to interesteds_path, notice: 'Interested was successfully updated.' }
        format.json { render :show, status: :ok, location: @interested }
      else
        format.html { render :edit }
        format.json { render json: @interested.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def download_b(course, locale)
    send_file "private/#{course}_#{locale}.pdf", :type => "application/pdf", :x_sendfile => true
  end
  def interested_params
    params.fetch(:interested).permit(:id, :email, :locale, :desc, :ip)
  end
  def set_interested
    @interested = Interested.find(params[:id])
  end
end
