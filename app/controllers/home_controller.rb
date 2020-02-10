class HomeController < ApplicationController

  before_action :set_user, except: :front

  def index
    @text = "Hellow world"
  end

  def front
    @text = "Goodbuy world"
  end

  private
  def set_user
    @user = current_user
  end
end
