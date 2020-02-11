class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    @posts = Post.active
  end

  def profile

  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end


end
