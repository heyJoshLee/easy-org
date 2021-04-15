class UsersController < ApplicationController

  before_action :require_user, only: [:create, :edit, :update ]
  before_action :set_user, only: [:edit, :update]

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
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your acount information was updated."
      redirect_to edit_user_path(@user)
    else
      flash.now[:danger] = "There was a problem and your account was not updated."
      render 'edit'
    end
  end
  
 private
  
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def set_user
    @user = current_user  
  end

end