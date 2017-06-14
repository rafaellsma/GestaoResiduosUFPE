class HomeController < ApplicationController
  def index
    redirect_to controller:'devise/sessions', action: 'new' unless current_user
  end
end
