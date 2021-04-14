class OrganizationsController < ApplicationController


  before_action :set_organization, only: [:show]

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
  end

  def index
    @organizations = Organization.all
  end


  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

end