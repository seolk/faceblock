class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :update, :edit, :destroy]

  def index
    @comments = @post.comments
  end

  def show

  end

  def new
    @comment = @post.comments.new
    render partial: "form"
  end

  def create
    binding.pry
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to post_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_post
      @post = current_user.posts.find(params[:post_id])
    end
    
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

end
# <%= fields_for @comment do |u| %>
#     <%= u.label :entry %>
#     <%= u.text_area :body %>
#     <%= u.submit "Submit" %>
# <% end %>
