class Users::RegistrationsController < Devise::RegistrationsController
  layout "devise", only: [:new, :create]

  def new
    @laboratories = Laboratory.avaiables
    if @laboratories.empty?
      redirect_to new_user_session_path, notice: 'Nenhum laboratório está disp'\
      'onivel. Entre em contato com o admininstrador para mais informações'
    else
      super
    end
	end

  protected

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
end
