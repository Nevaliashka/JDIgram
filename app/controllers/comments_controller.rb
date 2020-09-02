class CommentsController < ApplicationController
  before_action :authenticate_account!, :set_account

  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id if account_signed_in?
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.html { render :'posts/show' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end

  def set_account
    @current_account = Post.find(params[:account_id]) if params[:account_id].present?
  end
end