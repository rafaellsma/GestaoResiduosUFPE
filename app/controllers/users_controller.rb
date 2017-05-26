class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.admin = true
    @user.approved = true
    if @user.save
      redirect_to register_admin_url, notice: 'Usuario Admin Criado com sucesso'
    else
      render 'new_admin'
    end
  end

  def new_admin
    @user = User.new
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_ext)
  end
  def index
    @users = []
    @users = User.where(approved: true, admin: false) if params[:type] == '1'
    @users = User.where(approved: false, admin: false) if params[:type] == '0'
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
