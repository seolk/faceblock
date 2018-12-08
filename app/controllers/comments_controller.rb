class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :destroy]

  def new
    @comment = Comment.new
    # form
  end

  def create
    @comment = @post.comments.new(comment_params)
  end

  def edit
  end

  def destory
    @comment.destroy
    redirect_to post_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def set_comment
      @post = current_user.posts.find(params[:id])
    end

end
