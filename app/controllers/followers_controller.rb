class CommentsController < ApplicationController
  def destroy
    Follower.find(params[:id]).destroy
    redirect_to friendlist_path
  end
end