class HelpsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new, :create]
  before_action :set_help, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  
  # GET /helps
  # GET /helps.json
  def index
    @helps = Help.ultimos.all
  end

  # GET /helps/1
  # GET /helps/1.json
  def show
  end

  # GET /helps/new
  def new
    @help = Help.new
  end

  # GET /helps/1/edit
  def edit
  end

  # POST /helps
  # POST /helps.json
  def create
    @help = Help.new(email: params[:email].downcase, ip: params[:ip], locale: params[:locale], helped: params[:helped], desc: params[:desc])

    respond_to do |format|
      if @help.save
        format.html { redirect_to :back, notice: 'En breve nos pondremos en contacto con usted' }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helps/1
  # PATCH/PUT /helps/1.json
  def update
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to @help, notice: 'Help was successfully updated.' }
        format.json { render :show, status: :ok, location: @help }
      else
        format.html { render :edit }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helps/1
  # DELETE /helps/1.json
  def destroy
    @help.destroy
    respond_to do |format|
      format.html { redirect_to helps_url, notice: 'Help was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      @help = Help.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_params
      params.require(:help).permit(:email, :ip, :locale, :helped, :desc)
    end
end
