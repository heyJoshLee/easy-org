class PagesController < ApplicationController

  before_action :require_user, only: [:my_organizations]
  

  def my_organizations

  end

end