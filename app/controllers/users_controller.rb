class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user



  def show
    "Hellow world"
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :about, :avatar, :cover,
                                 :sex, :dob, :location, :phone_number)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end
end
