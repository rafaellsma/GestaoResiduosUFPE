class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.admin = true
    @user.approved = true
    @user.save

  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_ext)
  end
end
