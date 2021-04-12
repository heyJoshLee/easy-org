class OrganizationsController < ApplicationController


  before_action :set_organization, only: [:show]

  def new
    @organization = Organization.new
  end

  def create
    organization = Organization.new(organization_params)
    
    if organization.save
      organization_user = OrganizationUser.new(organization_id: organization.id, user_id: current_user.id)
      flash[:success] = "Your organization has been complete"
      redirect_to organization
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