class CommentsController < ApplicationController
  before_action :set_post, only: [:destroy]

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.html { redirect_to dashboard_path, notice: 'Não deixe campos em branco!'}
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def set_post
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
