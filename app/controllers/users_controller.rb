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

  def index
    @users = User.where(admin: false)
    if @users.empty?
      flash[:notice] = "Não existe nenhum usuário"
    end
  end

  def approve
    user = User.find(params[:user_id])
    lab = Laboratory.find(params[:laboratory_id])
    @users = User.where(approved: false, admin: false)
    if params[:commit] == 'desaprove!'
      user.disapprove!(lab)
      redirect_to controller: 'users', action: 'index'
    else
      user.approve!(lab)
      redirect_to controller: 'users', action: 'index'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_ext)
  end
end
