class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user    , except: :edit_about



  def show
    "Hellow world"
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def add_about
    #puts "\n\n params: #{params} \n\n"
    #puts "#{user_params[:about]}"
    #puts "#{@user}"
    # current_user.
    @user.update_attributes(about: user_params[:about])
    redirect_back(fallback_location: home_path)
  end
  def edit_about
    @user = current_user
    @user.update_attributes(about: params[:user][:about]) if params[:user]
    #redirect_to home_path
  end
  private

  def user_params
    params.require(:user).permit(:username, :about, :avatar, :cover,
                                 :sex, :dob, :location, :phone_number)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    puts "\n\n params: #{params} \n\n"
    @user = User.find(params[:id] || params[:user][:id])
  end
end
