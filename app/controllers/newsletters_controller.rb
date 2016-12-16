class NewslettersController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_newsletter, only: [:show, :destroy]
  layout "dashboard"
  
  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.paginate(page: params[:page],per_page: 10).ultimos.all 
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end
  

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)
    tipo_mensaje = "Newsletter"
    respond_to do |format|
      if @newsletter.save
        @courses.each do |course|
          if @newsletter.type_new == course.name
            tipo_mensaje = course.name
          end
        end 
        if tipo_mensaje == "Newsletter"
          NewsletterMailer.new_notice(@newsletter).deliver_now
        elsif tipo_mensaje == "All"
          NewsletterMailer.notice_all(@newsletter).deliver_now
        else
          NewsletterMailer.course_notice(@newsletter, tipo_mensaje).deliver_now
        end  
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:title, :body, :type_new, :language)
    end
  
end
