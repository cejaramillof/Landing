class SubscribersController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new, :create]
  before_action :set_subscriber, only: [:edit, :update, :destroy]
  layout "dashboard"
  def index
    @subscribers = Subscriber.paginate(page: params[:page],per_page: 10).ultimos.all
  end
  
  def create
    @email = Subscriber.new(email: params[:email].downcase, ip: params[:ip], locale: params[:locale])
    if @email.save
      ebook(locale)
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_path, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to subscribers_path, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit, layout: "dashboard" }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
    
  end
  private
  def ebook(locale)
    send_file "private/ebookWTM_#{locale}.pdf", :type => "application/pdf", :x_sendfile => true
  end
  def subscriber_params
    params.fetch(:subscriber).permit(:id, :email, :locale, :ip)
  end
  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end
end
