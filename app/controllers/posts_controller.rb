class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show]
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  layout "dashboard", except: [:show]
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.paginate(page: params[:page],per_page: 10).ultimos.all
    end
  end
  
  def new
    @post = Post.new
  end
    
  def show
  end  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end    
  end
  def create
    @post = current_admin.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter }        
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @interested }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  private
  def set_post
    @post = Post.find(params[:id])
  end  
  def post_params
    params.require(:post).permit(:title, :body, :locale, :cover, :all_tags)
  end  
end
