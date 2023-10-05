class CommentsController < ApplicationController
def new
  @comment = Comment.new
  @post = Post.find(params[:post_id])
end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
