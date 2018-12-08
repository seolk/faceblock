class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = current_user.posts.all
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end
 
  def create
    
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@posts.id)
    else
      flash[:success] = "Failed"
      render :new
    end
  end

  
  def edit
    render  partial: "form"
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end
 
  def destroy
    @post.destroy
    redirect_to roots_path
  end
 
  private
    def post_params
    params.require(:post).permit(:content)
    end

    def set_post
      @post = current_user.posts.find(params[:id])
    end
   
end
