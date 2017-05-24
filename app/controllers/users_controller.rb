class UsersController < ApplicationController
  def index
    @users = []
    if params[:type] == '1'
      @users = User.where(approved: true, admin: false)
    else
      @users = User.where(approved: false, admin: false)
    end
    flash[:notice] = ''
    if !params[:type].blank? && @users.empty?
       flash[:notice] = "Não existe nenhum usuário"
    end
  end

  def approve
    user = User.find(params[:user_id])
    @users = User.where(approved: false, admin: false)
    if params[:commit] == 'desaprove!'
      user.disapprove!
      redirect_to controller: 'users', action: 'index', type: 1
    else
      user.approve!
      redirect_to controller: 'users', action: 'index', type: 0
    end

  end
end
