class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.admin = true
    @user.approved = true
    if @user.save
      redirect_to 'home', notice: 'Usuario Criado com sucesso'
    else
      render 'new_admin'
    end
  end

  def new_admin
    User.new
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_ext)
  end
end
