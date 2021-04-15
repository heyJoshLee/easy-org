class OrganizationsController < ApplicationController


  before_action :set_organization, only: [:show, :users, :new_user]

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.build(organization_params)
    
    if @organization.save
      current_user.organizations << @organization
      flash[:success] = "Your organization has been complete"
      redirect_to @organization
    else
      render 'new'
    end
  end

  def show
    @sticky_message = StickyMessage.new
    @sticky_type = "organization"
    @sticky_type_id = @organization.id
  end

  def index
    @organizations = Organization.all
  end

  def users
    @user = User.new
    @users = @organization.users
  end

  def new_user
    user = User.find_by(email: params[:user][:email])
    if user
      @organization.users << user
      flash[:success] = "User has been added."
      redirect_to users_organization_path(@organization)
    else
      flash.now[:danger] = "User could not be added."
      @users = @organization.users

      render "users"
    end


    
    # user = User.new(user_params)
    # if user.save
    #   @organization.users << user
    #   flash[:success] = "New user created."
    #   redirect_to users_organization_path(@organization)
    # else
    #   flash.now[:alert] = "There was a problem and the user was not created."
    #   render "users"
    # end
    
  end


  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

end