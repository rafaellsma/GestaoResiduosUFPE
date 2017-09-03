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
end
