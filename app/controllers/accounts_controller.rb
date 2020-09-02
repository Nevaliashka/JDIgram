class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    @accounts = Account.where(["username LIKE ?", "%#{params[:search]}%"]).limit(10)
  end

  def messages
      session[:conversations] ||= []

      @accounts = Follower.where(follower_id: current_account.id)
      @conversations = Conversation.includes(:recipient, :messages)
                           .find(session[:conversations])

  end

  def dashboard
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
    @posts = Post.includes(:account).where(account_id: following_ids).active
    @comment = Comment.new
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def friendlist
    @friends = Follower.where(follower_id: current_account.id)
  end

  def subscribers
    @subscribers = Follower.where(following_id: current_account.id)
  end

  def profile
    @posts = @account.posts.active
  end

  def delete_friend
    @follower = Follower.find(params[:follower_id])
    respond_to do |format|
      format.js
    end
    @follower.destroy
  end

  def follow_account
    follower_id = params[:follow_id]
    @follower = Follower.create(follower_id: current_account.id, following_id: follower_id)
    respond_to do |format|
      format.js
    end
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end

end
