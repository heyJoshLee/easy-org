class PagesController < ApplicationController

  before_action :require_user, only: [:my_organizations]
  

  def index
    if logged_in?
      redirect_to my_organizations_path
    else
    render layout: "home"
    end
  end

  def my_organizations
  end

end