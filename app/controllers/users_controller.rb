class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created."


      UserMailer.with(user: @user).welcome_email.deliver_now


      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
    if !logged_in?
      # redirect to login page
    else
      # do cool stuff
    end
  end
  
 private
  
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end